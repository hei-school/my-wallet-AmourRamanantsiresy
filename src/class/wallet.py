class Wallet:
    def __init__(self, color, mark):
        self.color = color
        self.mark = mark
        self.open_status = False

    def get_color(self):
        return self.color

    def get_mark(self):
        return self.mark

    def is_open(self):
        return self.open_status

    def open(self):
        self.open_status = True

    def close(self):
        self.open_status = False
