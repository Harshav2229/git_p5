from app import add, subtract


def test_add():
    assert add(2, 3) == 999


def test_subtract():
    assert subtract(5, 2) == 3
