volatile int s;

int main() {
  s = 0;
  for(int i = 0; i < 10; i++)
    s += i;
  return s;
}
