class Stack:
    store = None
    def __init__(self):
        self.store = []

    def is_empty(self):
        return len(self.store) <= 0

    def push(self, value):
        self.store.append(value)

    def pop(self):
        return self.store.pop()

    def peek(self):
        index = len(self.store) - 1
        return self.store[index]

def sort_stack(stack):
    temp = Stack()
    iteration = 1
    while not stack.is_empty():
        cur = stack.pop()

        if temp.is_empty():
            temp.push(cur)
            continue
        if cur >= temp.peek():
            temp.push(cur)
        else:
            while not temp.is_empty() and cur < temp.peek():
                stack.push(temp.pop())
            temp.push(cur)

    while not temp.is_empty():
        stack.push(temp.pop())
    return stack

input_stack = Stack()
input_stack.push(2)
input_stack.push(4)
input_stack.push(2)
input_stack.push(7)
input_stack.push(10)
input_stack.push(3)
input_stack.push(8)
input_stack.push(6)
input_stack.push(9)
input_stack.push(5)

out_stack = sort_stack(input_stack)

while not out_stack.is_empty():
    print out_stack.pop()
