/*
* Copyright (C) 2025 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the 'License');
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an 'AS IS' BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

export async function asyncFunctionTest043() {

  async function* asyncGenerator(): AsyncGenerator<number, void, unknown> {
    yield 1;
    yield 2;
    yield 3;
  }

  const callAsyncGenerator = async (): Promise<number[]> => {
    const gen = asyncGenerator();
    const results: number[] = [];
    for await (const val of gen) {
      results.push(val);
    }
    return results;
  };
  const result = await callAsyncGenerator();
  return result
}

export async function asyncFunctionTest053() {
  type AsyncObj = {
    step1: (num: number) => Promise<number>;
    step2: (num: number) => Promise<number>;
    step3: {
      nestedStep: (num: number) => Promise<number>;
    };
  };

  const asyncObj: AsyncObj = {
    step1: async (num: number): Promise<number> => await Promise.resolve(num + 5),
    step2: async (num: number): Promise<number> => await Promise.resolve(num * 3),
    step3: {
      nestedStep: async (num: number): Promise<number> => await Promise.resolve(num - 2)
    }
  };

  const runObjSteps = async (): Promise<number> => {
    let val = 4;
    val = await asyncObj.step1(val); // 4→9
    val = await asyncObj.step2(val); // 9→27
    val = await asyncObj.step3.nestedStep(val); // 27→25
    return val;
  };
  const result = await runObjSteps();
  return result
}

export async function asyncFunctionTest063() {
  type UserModule = {
    auth: {
      login: (user: string, pwd: string) => Promise<boolean>;
      getToken: () => Promise<string>;
    };
    profile: {
      get: (token: string) => Promise<{ name: string; id: number }>;
    };
  };

  const userModule: UserModule = {
    auth: {
      login: async (user: string, pwd: string): Promise<boolean> => {
        const nestedAuth = async (): Promise<boolean> => await Promise.resolve(user === 'test' && pwd === '123');
        return await nestedAuth();
      },
      getToken: async (): Promise<string> => {
        const nestedToken = async (): Promise<string> => await Promise.resolve('token_123');
        return await nestedToken();
      }
    },
    profile: {
      get: async (token: string): Promise<{ name: string; id: number }> => {
        const nestedProfile = async (): Promise<{ name: string; id: number }> => {
          if (token) {
            return await Promise.resolve({ name: 'test', id: 1 });
          }
          throw new Error('no token');
        };
        return await nestedProfile();
      }
    }
  };

  const getUserProfile = async (user: string, pwd: string): Promise<{ name: string; id: number }> => {
    const isLogin = await userModule.auth.login(user, pwd);
    if (!isLogin) {
      throw new Error('login fail');
    }
    const token = await userModule.auth.getToken();
    return await userModule.profile.get(token);
  };
  const result = await getUserProfile('test', '123');
  return result
}


export async function asyncFunctionTest090() {
  // Typed async function composition
  const compose = <A, B, C>(
    f: (b: B) => Promise<C>,
    g: (a: A) => Promise<B>
  ): ((a: A) => Promise<C>) => {
    return async (a: A) => f(await g(a));
  };

  const add5 = async (num: number): Promise<number> => await Promise.resolve(num + 5);
  const multiply2 = async (num: number): Promise<number> => await Promise.resolve(num * 2);

  const composed = compose(multiply2, add5); // (num +5) *2
  const result = await composed(3); // (3+5)*2=16
  return result
}

export async function asyncFunctionTest087() {
  type User = {
    id: number;
    profile?: {
      name: string;
      address?: {
        city: string;
      };
    };
  };

  const getCity = async (user: User): Promise<string | null> => {
    const nestedGet = async (): Promise<string | null> => {
      const city = user.profile?.address?.city;
      return await Promise.resolve(city ?? null);
    };
    return await nestedGet();
  };

  const user1: User = { id: 1, profile: { name: 'A', address: { city: 'NY' } } };
  const user2: User = { id: 2, profile: { name: 'B' } };
  const user3: User = { id: 3 };

  const city1 = await getCity(user1);
  const city2 = await getCity(user2);
  const city3 = await getCity(user3);
  return city1=='NY'&& city2==null&& city3==null
}

export async function asyncFunctionTest089() {
  class DataStore<T> {
    private data: T[] = [];

    async add(item: T): Promise<number> {
      const nestedAdd = async (): Promise<number> => {
        this.data.push(item);
        return await Promise.resolve(this.data.length);
      };
      return await nestedAdd();
    }

    async get(index: number): Promise<T | undefined> {
      const nestedGet = async (): Promise<T | undefined> => {
        return await Promise.resolve(this.data[index]);
      };
      return await nestedGet();
    }
  }

  const useDataStore = async (): Promise<type89> => {
    const store = new DataStore<string>();
    const length = await store.add('item1');
    const item = await store.get(0);
    return { length, item };
  };

  const result = await useDataStore();
  return result
}


export async function asyncFunctionTest091() {

  async function* gen1(): AsyncGenerator<number> {
    yield await Promise.resolve(1);
    yield await Promise.resolve(2);
  }

  async function* gen2(): AsyncGenerator<number> {
    yield await Promise.resolve(3);
    yield await Promise.resolve(4);
  }

  const composeGens = async (): Promise<number[]> => {
    const nestedCompose = async function* (): AsyncGenerator<number> {
      yield * gen1();
      yield * gen2();
    };

    const results: number[] = [];
    for await (const val of nestedCompose()) {
      results.push(val);
    }
    return results;
  };

  const result = await composeGens();
  return result
}

export async function asyncFunctionTest016(){
  const obj = {
    async method(num: number): Promise<number> {
      return num * 2;
    }
  };
  const result = await obj.method(7);
  return result
}
export async function asyncFunctionTest068(){
  const getReadonly = async (): Promise<ReadonlyData> => {
    const nestedGet = async (): Promise<ReadonlyData> => {
      return await Promise.resolve({ id: 1, name: 'readonly' });
    };
    return await nestedGet();
  };

  const processReadonly = async (): Promise<type68> => {
    const data = await getReadonly();
    // Return mutable copy (original is readonly)
    return { id: data.id, name: data.name };
  };
  const result = await processReadonly();
  result.name = 'modified';
  return result
}
export async function asyncFunctionTest099(){
  const createAsyncGenerator = async function* (limit: number, step: number): AsyncGenerator<number> {
    let current = 0;
    while (current < limit) {
      await new Promise(resolve => setTimeout(resolve, 2));
      yield current;
      current += step;
    }
  };
  const collectValues = async (): Promise<number[]> => {
    const values: number[] = [];
    for await (const val of createAsyncGenerator(10, 3)) {
      values.push(val);
    }
    return values;
  };
  const result = await collectValues();
  return result
}
export type type62 = { str: string; num: number }
export type type96 = { uid: string; label: string }

export type type68 = { id: number; name: string }
export type type93 = { success: number; failed: number }
export type type94 = { asyncIncrement: (step: number) => Promise<number>; getCount: ()=>number }

export type type89 = { length: number; item: string | undefined }

export type type83 = { size: number; hasFive: boolean }

export type ApiResponse = { data: number };

export type FormData = { username: string; password: string };

export type User = {
  id: number;
  name: string;
  email?: string | null; // Nullable optional property
};

export type CacheKey = { id: number };

export type type71 = { firstCall: string, secondCall: string }
export type type100 = { valid: Data[]; processed: string[]; count: number }

export interface Data { id: number; value: string }
export type ConfigRecord = Record<string, string | number | boolean>;

export type Product = { id: number; price: number; inStock: boolean };

export type ReadonlyData = {
  readonly id: number;
  readonly name: string;
};

export type ResultObj = { key: string; count: number };
export type type86 = { taskId: number; result: number };