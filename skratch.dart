void main() {
  performTasks();
}

/* ASYNC CODING
- Add modifier async to the method that should wait
- Then you get access to the keyword await to put in front of the method to wait for
- The method to wait for must return a Future (can be of any type)
- Add the modifier async to the method returning a Future
- Put keyword await in front of the internal method to wait for
 */
void performTasks() async {
  task1();
  String task2Result = await task2();
  task3(task2Result);
}

void task1() {
  print('Task 1 complete');
}

// Future is dynamic (can get and change type)
// We can specify the type e.g. <String>
Future<String> task2() async {
  Duration threeSeconds = Duration(seconds: 3);
  String result;

  // SYNC METHOD keyword: sleep (from dart:io package)
  //sleep(threeSeconds);
  // ASYNC METHOD keyword: Future -> input: delay + callback (){ do something after delay }
  // the same as Dispatch.main.asyncAfter() in Swift
  await Future.delayed(threeSeconds, () {
    result = 'task 2 data';
    print('Task 2 complete');
  });

  return result;
}

void task3(String task2Data) {
  print('Task 3 complete with $task2Data');
}
