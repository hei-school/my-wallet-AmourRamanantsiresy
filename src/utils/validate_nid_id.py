from messages import messages


def validate_nid_id(nid_id):
    if not nid_id or len(nid_id) != 12 or not nid_id.isdigit():
        raise ValueError(messages["bad_NID_id"])
