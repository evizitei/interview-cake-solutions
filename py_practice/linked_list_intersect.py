class LinkedListNode:
    nextNode = None
    data = None

    def __init__(self, value):
        self.data = value

def intersection(h1, h2):
    nodes = set()
    n1 = h1
    while n1 is not None:
        nodes.add(id(n1))
        n1 = n1.nextNode

    n2 = h2
    while n2 is not None:
        if id(n2) in nodes:
            return n2
        n2 = n2.nextNode

    return False


def chop_by(head, count):
    for i in range(count):
        head = head.nextNode
    return head

def lengthAndTail(head):
    tail = head
    length = 0
    while tail is not None:
        length += 1
        tail = tail.nextNode
    return (length, tail)

def constant_space_intersection(h1, h2):
    length1 = 0
    length2 = 0
    tail1 = None
    tail2 = None

    lAndT = lengthAndTail(h1)
    length1, tail1 = lAndT[0], lAndT[1]

    lAndT = lengthAndTail(h2)
    length2, tail2 = lAndT[0], lAndT[1]
    
    if tail1 is not tail2:
        return False

    if length1 > length2:
        h1 = chop_by(h1, length1 - length2)
    elif length2 > length1:
        h2 = chop_by(h2, length2 - length1)

    n1 = h1
    n2 = h2
    while n1 is not None:
        if n1 is n2:
            return n1
        n1 = n1.nextNode
        n2 = n2.nextNode

tail = LinkedListNode(4)
n = LinkedListNode(3)
n.nextNode = tail

h1 = LinkedListNode(2)
h1.nextNode = n

n2 = LinkedListNode(1)
n2.nextNode = n

h2 = LinkedListNode(5)
h2.nextNode = n2


inter = intersection(h1, h2)
const_inter = constant_space_intersection(h1, h2)

print "intersection is " + str(inter.data)
print "const space intersection is " + str(const_inter.data)
