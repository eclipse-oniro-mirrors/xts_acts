/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { expect} from '@ohos/hypium';
import hilog from '@ohos.hilog';

export const writableSkip = { skip: false }
export function log(...s:any){
  hilog.info(0x0000, 'testTags', '%{public}s', ...s);
}
export namespace common {
  const mustChecks: any[] = [];

  export function mustNotCall() {
    return mustCall(() => {
    }, 0);
  }

  export function mustCall(fn?: Function, times = 1) {
    if (!fn) {
      fn = () => {}
    }
    if (typeof fn !== "function") {
      throw new Error("fn Parameter error")
    }
    if (typeof times !== "number") {
      throw new Error("times Parameter error")
    }
    let callCount = 0;
    let wrappedFn = (...args: any[]) => {
      callCount++;
      return fn.apply(this, args);
    }
    mustChecks.push(() => {
      if (callCount !== times) {
        throw new Error(`Function was expected to be called ${ times } times, but was called ${ callCount } times.`);
      }
    });
    return wrappedFn;
  }

  export function mustCallCheckAll(sleep:number = 20) {
    return new Promise((resolve,reject)=>{
      setTimeout(() => {
        try {
          mustChecks.forEach(check => check());
          mustChecks.length = 0;
          resolve(true);
        } catch (e) {
          hilog.info(0x0000, 'testTags', '%{public}s', `error :${e}`);
          reject(e)
		}
      }, sleep)
    })
  }

  export function expectsError(obj: any) {
    return mustCall((e: any) => {
      Reflect.ownKeys(obj).forEach((it): void =>{
        expect(e[it]).assertEqual(obj[it]);
      } )
    })
  }
}