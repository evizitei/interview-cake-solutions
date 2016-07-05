class SetOfStacks:
    stacks = []
    pointers = []
    cur_stack = 0
    max_height = 10

    def __init__(self):
        self.stacks.append(None)
        self.pointers.append(None)
        self.stacks[self.cur_stack] = self.max_height * [None]
        self.pointers[self.cur_stack] = 0

    def push(self, value):
        cur_pointer = self.pointers[self.cur_stack]
        if cur_pointer >= self.max_height:
            self.cur_stack += 1
            if self.cur_stack >= len(self.stacks):
                self.stacks.append(None)
                self.pointers.append(None)
            self.stacks[self.cur_stack] = self.max_height*[None]
            self.pointers[self.cur_stack] = 0
            cur_pointer = 0
        self.stacks[self.cur_stack][cur_pointer] = value
        self.pointers[self.cur_stack] = cur_pointer + 1

    def pop(self):
        cur_pointer = self.pointers[self.cur_stack] - 1
        value = self.stacks[self.cur_stack][cur_pointer]
        if cur_pointer <= 0:
            if self.cur_stack > 0:
                self.cur_stack -= 1
            else:
                self.pointers[self.cur_stack] = 0
        else:
            self.pointers[self.cur_stack] = cur_pointer
        return value

stack = SetOfStacks()

for i in range(15):
    stack.push(i)

for i in range(15):
    print stack.pop()
