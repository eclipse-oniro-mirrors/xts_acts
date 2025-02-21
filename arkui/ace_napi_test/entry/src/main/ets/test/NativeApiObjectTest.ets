/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "hypium/index"

// @ts-ignore
import napitest from 'libnapitest.so'

function deepStrictEqualOfArray(obj1, obj2) {
  expect(obj1).assertInstanceOf('Array');
  expect(obj2).assertInstanceOf('Array');
  expect(obj1.length).assertEqual(obj2.length);
  for (let i = 0; i < obj1.length; i++) {
    if ((obj1[i] instanceof Symbol) && (obj2[i] instanceof Symbol)) {
      expect(obj1[i].toString()).assertEqual(obj2[i].toString());
    } else {
      expect(obj1[i] === obj2[i]).assertTrue();
    }
  }
}

function deepStrictEqualOfObject(obj1, obj2) {
  deepStrictEqualOfArray(Object.keys(obj1), Object.keys(obj2));
  for(let key in obj1){
    expect(obj1[key]).assertEqual(obj2[key]);
  }
}

function addSeal() {
  const obj = { x: 'a', y: 'b', z: 'c' };
  napitest.SealTest(obj);
  // @ts-ignore
  obj.w = 'd';
}

function deleteSeal() {
  const obj = { x: 'a', y: 'b', z: 'c' };
  napitest.SealTest(obj);
  // @ts-ignore
  delete obj.x;
}

function assignFreeze() {
  const obj = { x: 10, y: 10, z: 10 };
  napitest.FreezeTest(obj);
  // @ts-ignore
  obj.x = 10;
}

function addFreeze() {
  const obj = { x: 10, y: 10, z: 10 };
  napitest.FreezeTest(obj);
  // @ts-ignore
  obj.w = 15;
}

function deleteFreeze() {
  const obj = { x: 10, y: 10, z: 10 };
  napitest.FreezeTest(obj);
  // @ts-ignore
  delete obj.x;
}

const fooSymbol = Symbol('foo');

function createObject() {
  const object = { __proto__: {
                               inherited: 1,
                              }
                 };
  // @ts-ignore
  object.normal = 2;
  object[fooSymbol] = 3;
  Object.defineProperty(object,
                        'unenumerable',
                        {
                         value: 4,
                         enumerable: false,
                         writable: true,
                         configurable: true,
                        });
  Object.defineProperty(object,
                        'writable',
                        {
                         value: 4,
                         enumerable: true,
                         writable: true,
                         configurable: false,
                        });
  Object.defineProperty(object,
                        'configurable',
                        {
                         value: 4,
                         enumerable: true,
                         writable: false,
                         configurable: true,
                        });
  object[5] = 5;
  return object;
}

export default function npiObjectTest() {

  describe('npiObjectTest', function () {

    /**
    * run after testcase
    */
    afterEach(async function () {
      console.info('[npiObjectTest] after each called')
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0001
    * @tc.name      napiObjectTest001
    * @tc.desc      aceNapiEtsTest
    */
    it('napiObjectTest001', 0, function() {
      const testObject = createObject();
      deepStrictEqualOfArray(napitest.GetSymbolNames(testObject),[fooSymbol]);
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0002
    * @tc.name      napiObjectTest002
    * @tc.desc      aceNapiEtsTest
    */
    it('napiObjectTest002', 0, function() {
      const testObject = createObject();
      deepStrictEqualOfArray(napitest.GetEnumerableWritableNames(testObject),
                             ['5',
                              'normal',
                              'writable',
                              fooSymbol,
                              'inherited']);
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0003
    * @tc.name      napiObjectTest003
    * @tc.desc      aceNapiEtsTest
    */
    it('napiObjectTest003', 0, function() {
      const testObject = createObject();
      deepStrictEqualOfArray(napitest.GetOwnWritableNames(testObject),
                             ['5',
                              'normal',
                              'unenumerable',
                              'writable',
                              fooSymbol]);
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0004
    * @tc.name      napiObjectTest004
    * @tc.desc      aceNapiEtsTest
    */
    it('napiObjectTest004', 0, function() {
      const testObject = createObject();
      deepStrictEqualOfArray(napitest.GetEnumerableConfigurableNames(testObject),
                             ['5',
                             'normal',
                             'configurable',
                             fooSymbol,
                             'inherited']);
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0005
    * @tc.name      napiObjectTest005
    * @tc.desc      aceNapiEtsTest
    */
    it('napiObjectTest005', 0, function() {
      const testObject = createObject();
      deepStrictEqualOfArray(napitest.GetOwnConfigurableNames(testObject),
                             ['5',
                              'normal',
                              'unenumerable',
                              'configurable',
                              fooSymbol]);
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0006
    * @tc.name      napiObjectTest006
    * @tc.desc      aceNapiEtsTest
    */
    it('napiObjectTest006', 0, function() {
      const expectedForElement = {
                                  envIsNull: 'Invalid argument',
                                  objectIsNull: 'Invalid parameter',
                                  valueIsNull: 'Invalid parameter',
                                 };
      deepStrictEqualOfObject(napitest.GetAllPropertyNames(), expectedForElement);
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0007
    * @tc.name      napiObjectTest007
    * @tc.desc      aceNapiEtsTest
    */
    it('napiObjectTest007', 0, function () {
      const obj = {
                   x: 10,
                   y: 10,
                   z: 10,
                  };
      napitest.FreezeTest(obj);
      expect(Object.isFrozen(obj)).assertDeepEquals(true);
      expect(assignFreeze).assertThrowError("Cannot assign to read only property");
      expect(addFreeze).assertThrowError("Cannot add property in prevent extensions");
      expect(deleteFreeze).assertThrowError("Cannot delete property");
    })

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0008
    * @tc.name      napiObjectTest008
    * @tc.desc      aceNapiEtsTest
    */
    it('napiObjectTest008', 0, function() {
      const obj = {
                   x: 'a',
                   y: 'b',
                   z: 'c',
                  };
      napitest.SealTest(obj);
      expect(Object.isSealed(obj)).assertDeepEquals(true);
      expect(addSeal).assertThrowError("Cannot add property in prevent extensions");
      expect(deleteSeal).assertThrowError("Cannot delete property");
      obj.x = 'd';
    })
  })
}