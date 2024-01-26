import argparse
import secrets

def generate_random_word(file_path):
    with open(file_path, 'r') as file:
        words = file.read().splitlines()
        return secrets.choice(words)

def generate_random_numbers():
    return ''.join(secrets.choice('0123456789') for _ in range(3))

def generate_result():
    adjective = generate_random_word('adj.txt')
    noun = generate_random_word('noun.txt')
    numbers = generate_random_numbers()
    return adjective.upper() + noun.upper() + numbers

def main():
    parser = argparse.ArgumentParser(description='Generate random strings based on words from files.')
    parser.add_argument('-n', type=int, default=1, help='Number of results to generate')
    
    try:
        args = parser.parse_args()
    except argparse.ArgumentError as exc:
        print(f"Error: {exc}")
        parser.print_help()
        exit(1)

    for _ in range(args.n):
        result = generate_result()
        print(result)

if __name__ == "__main__":
    main()
