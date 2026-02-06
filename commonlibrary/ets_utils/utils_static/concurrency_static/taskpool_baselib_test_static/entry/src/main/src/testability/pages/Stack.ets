'use static'
import { Stack } from '@kit.ArkTS';
import { C1 } from './importclass';


export function stackPush() {
  let TAG = 'stackPush'
  try {
    try {
      let stack: Stack<number> = new Stack<number>();
      let result = stack.push(1)
      if (result !== 1) {
        throw new Error(`${TAG} value.toString() invalid: ${result.toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err}`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function stackPop() {
  let TAG = 'stackPop'
  try {
    try {
      let stack: Stack<number | string | object | undefined> = new Stack<number | string | object | undefined>();
      stack.push(undefined)
      let result = stack.pop()
      if (result !== undefined) {
        throw new Error(`${TAG} value.toString() invalid: ${result.toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err}`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function stackPeek() {
  let TAG = 'stackPeek'
  try {
    try {
      let stack: Stack<number | string | object> = new Stack<number | string | object>();
      let a: C1 = {
        name: 'Dylon', age: '13'
      };
      let b = 'a'
      let c: int = 1
      stack.push(a)
      stack.push(b)
      stack.push(c)
      let result = stack.peek();
      if (result !== c) {
        throw new Error(`${TAG} value.toString() invalid: ${result.toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err}`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function stackLocate() {
  let TAG = 'stackLocate'
  try {
    try {
      let stack: Stack<number | string | object> = new Stack<number | string | object>();
      let a: C1 = {
        name: 'Dylon', age: '13'
      };
      let b = 'a'
      let c: int = 1
      stack.push(a)
      stack.push(b)
      stack.push(c)
      let result = stack.locate(a);
      if (result !== 0) {
        throw new Error(`${TAG} value.toString() invalid: ${result.toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err}`);
    }

  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function stackForEach() {
  let TAG = 'stackForEach'
  try {
    try {
      let stack: Stack<number> = new Stack<number>();
      stack.push(1)
      stack.push(2)
      stack.push(3)
      stack.push(3)
      stack.forEach((item, index) => {
        let result1 = item
        let result2 = index
        if (result1 !== item) {
          throw new Error(`${TAG} value.toString() invalid: ${result1.toString()}`)
        }
        if (result2 !== index) {
          throw new Error(`${TAG} value.toString() invalid: ${result2}`)
        }
      })
    } catch (err) {
      console.error(`${TAG} failed, error: ${err}`);

    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function stackIsEmpty() {
  let TAG = 'stackIsEmpty'
  try {
    try {
      let stack: Stack<number> = new Stack<number>();
      stack.push(1)
      stack.push(2)
      stack.push(3)
      stack.push(3)
      let result = stack.isEmpty()

      if (result !== false) {
        throw new Error(`${TAG} value.toString() invalid: ${result.toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err}`);

    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function stackLength() {
  let TAG = 'stackLength'
  try {
    try {
      let stack: Stack<number> = new Stack<number>();
      stack.push(1);
      stack.push(2);
      stack.push(3);
      stack.push(3);
      let result: int = stack.length;

      if (result !== 4) {
        throw new Error(`${TAG} value.toString() invalid: ${result.toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err}`);

    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}