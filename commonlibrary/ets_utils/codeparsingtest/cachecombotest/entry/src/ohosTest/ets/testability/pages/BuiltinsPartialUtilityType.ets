import { createProxy } from './Proxy';

@Concurrent
export function BuiltinsPartialUtilityTypeTest0100() {
  let TAG = 'BuiltinsPartialUtilityTypeTest0100'
  try {
    interface User {
      name: string;
      age: number;
    }

    type PartialUser = Partial<User>;
    const partialUser: PartialUser = {
      name: 'John'
    };
    if (partialUser.name !== 'John') {
      throw new Error(`${TAG} value.toString() invalid: ${partialUser.name}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export function BuiltinsPrivateFieldsUtilityTypeTest0100() {
  let TAG = 'BuiltinsPrivateFieldsUtilityTypeTest0100'
  try {
    interface PersonInfo {
      name: string;
      age: number;
    }

    class Person {
      private name: string;
      private age: number;

      constructor(name: string, age: number) {
        this.name = name;
        this.age = age;
      }

      setName(name: string): void {
        this.name = name;
      }

      setAge(age: number): void {
        this.age = age;
      }

      updateInfo(info: Partial<PersonInfo>): void {
        if (info.name !== undefined) {
          this.name = info.name;
        }
        if (info.age !== undefined) {
          this.age = info.age;
        }
      }

      getName(): string {
        return this.name;
      }

      getAge(): number {
        return this.age;
      }
    }

    const person = new Person('Alice', 25);
    console.log(`Initial Name: ${person.getName()}`);
    console.log(`Initial Age: ${person.getAge()}`);
    const partialInfo: Partial<PersonInfo> = {
      name: 'Bob',
      age: 30
    };
    person.updateInfo(partialInfo);
    console.log(`Updated Name: ${person.getName()}`);
    console.log(`Updated Age: ${person.getAge()}`);
    if (person.getName() !== 'Bob' || person.getAge() !== 30) {
      throw new Error(`${TAG} value.toString() invalid: ${person.getName()}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export function builtinsProxyTest0100() {
  let TAG = 'builtinsProxyTest0100'
  try {
    interface User {
      name: string;
      age: number;
    }

    const user: User = { name: 'Alice', age: 25 };
    const userProxy = createProxy(user) as User;
    if (userProxy.name !== 'Alice') {
      throw new Error(`${TAG} value.toString() invalid: ${userProxy.name}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export function BuiltinsReadonlyUtilityTypeTest0100() {
  let TAG = 'BuiltinsReadonlyUtilityTypeTest0100'
  try {
    interface Settings {
      theme?: string;
      fontSize?: number;
    }
    type ReadonlySettings = Readonly<Settings>;
    const mySettings: ReadonlySettings = {};
    console.log(JSON.stringify(mySettings));
    if (JSON.stringify(mySettings) !== JSON.stringify({})) {
      throw new Error(`${TAG} value.toString() invalid: ${JSON.stringify(mySettings)}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export function BuiltinsRecordUtilityTypeTest0100() {
  let TAG = 'BuiltinsRecordUtilityTypeTest0100'
  try {
    const numberRecord: Record<string, number> = {
      'one': 1,
      'two': 2,
      'three': 3
    };
    const stringRecord: Record<number, string> = {
      1: 'apple',
      2: 'banana',
      3: 'cherry'
    };
    console.log(JSON.stringify(numberRecord));
    console.log(JSON.stringify(stringRecord));
    type KeyType = 'name' | 'age' | 'email';
    const userRecord: Record<KeyType, string> = {} as Record<KeyType, string>;
    userRecord.name = 'John Doe';
    userRecord.age = '30';
    userRecord.email = 'johndoe@example.com';
    console.log(JSON.stringify(userRecord));
    if (JSON.stringify({'one':1,'two':2,'three':3}) !== JSON.stringify(numberRecord)) {
      throw new Error(`${TAG} value.toString() invalid: ${JSON.stringify(numberRecord)}`)
    }
    if (JSON.stringify({'1':'apple','2':'banana','3':'cherry'}) !== JSON.stringify(stringRecord)) {
      throw new Error(`${TAG} value.toString() invalid: ${JSON.stringify(stringRecord)}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}