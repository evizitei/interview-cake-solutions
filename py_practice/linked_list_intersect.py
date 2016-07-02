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
print "intersection is " + str(inter.data)
