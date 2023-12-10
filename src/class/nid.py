class NID:
    def __init__(self, first_name, last_name, nid, birth_date, birth_place):
        self.first_name = first_name
        self.last_name = last_name
        self.id = nid
        self.birth_date = birth_date
        self.birth_place = birth_place

    def get(self):
        return [
            self.first_name,
            self.last_name,
            self.id,
            self.birth_date,
            self.birth_place,
        ]
