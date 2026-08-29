def add(a, b):
    return a + b


def subtract(a, b):
    return a - b


def application_message():
    return "Calculator - Resolved Version"


def run_calculator():
    print("\n=== Gitflow Calculator ===")
    print("Enter two numbers and choose an operation.")

    while True:
        print("\n1. Add")
        print("2. Subtract")
        print("3. Exit")

        choice = input("Choose an option: ").strip()

        if choice == "3":
            print("Thank you for using the calculator!")
            break

        if choice not in {"1", "2"}:
            print("Invalid choice. Please select 1, 2, or 3.")
            continue

        try:
            a = float(input("Enter first number: "))
            b = float(input("Enter second number: "))
        except ValueError:
            print("Please enter valid numbers.")
            continue

        if choice == "1":
            print(f"Result: {add(a, b)}")
        else:
            print(f"Result: {subtract(a, b)}")


if __name__ == "__main__":
    run_calculator()
