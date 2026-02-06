/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Size, Level, TestType } from "@ohos/hypium";
import User from "../Interface/InterfaceExport";
import User1 from "../Interface/InterfaceExport1";
import User2 from "../Interface/InterfaceExport2";
import { User3, User4, User5, User6Name } from "../Interface/InterfaceExport3";
import { newUser7 } from "../Interface/InterfaceExport5";
import * as newUser8 from "../Interface/InterfaceExport4";
import { sleep } from "../utils/Utils";


export default function ExportInterfaceTest() {
  describe('ExportInterfaceTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number SUB_EXPORT_INTERFACE_TEST_0100
     * @tc.name ExportInterfaceTest0100
     * @tc.desc test Interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('ExportInterfaceTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done: Function) => {
      const newUser: User = {
        name: 'John Doe',
        age: 30,
        email: 'johndoe@example.com'
      };
      expect(newUser.name).assertContain('John Doe');
      expect(newUser.age).assertEqual(30);
      expect(newUser.email).assertContain('johndoe@example.com');
      Done();
    });


    /**
     * @tc.number SUB_EXPORT_INTERFACE_TEST_0200
     * @tc.name ExportInterfaceTest0200
     * @tc.desc test Interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExportInterfaceTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      expect(User1.name).assertContain('John Doe');
      expect(User1.age).assertEqual(30);
      expect(User1.email).assertContain('johndoe@example.com');
      Done();
    });


    /**
     * @tc.number SUB_EXPORT_INTERFACE_TEST_0300
     * @tc.name ExportInterfaceTest0300
     * @tc.desc test Interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExportInterfaceTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      expect(User2.name).assertContain('John Doe');
      expect(User2.age).assertEqual(30);
      expect(User2.email).assertContain('johndoe@example.com');
      Done();
    });


    /**
     * @tc.number SUB_EXPORT_INTERFACE_TEST_0400
     * @tc.name ExportInterfaceTest0400
     * @tc.desc test Interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExportInterfaceTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const newUser1: User3 = {
        name: 'John Doe',
        age: 30,
        email: 'johndoe@example.com'
      };
      expect(newUser1.name).assertContain('John Doe');
      expect(newUser1.age).assertEqual(30);
      expect(newUser1.email).assertContain('johndoe@example.com');
      Done();
    });


    /**
     * @tc.number SUB_EXPORT_INTERFACE_TEST_0500
     * @tc.name ExportInterfaceTest0500
     * @tc.desc test Interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExportInterfaceTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const newUser2: User4 = {
        name: 'John Doe',
        age: 30,
        email: 'johndoe@example.com'
      };
      expect(newUser2.name).assertContain('John Doe');
      expect(newUser2.age).assertEqual(30);
      expect(newUser2.email).assertContain('johndoe@example.com');
      Done();
    });


    /**
     * @tc.number SUB_EXPORT_INTERFACE_TEST_0600
     * @tc.name ExportInterfaceTest0600
     * @tc.desc test Interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExportInterfaceTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const newUser3: User5 = {
        name: 'John Doe',
        age: 30,
        email: 'johndoe@example.com'
      };
      expect(newUser3.name).assertContain('John Doe');
      expect(newUser3.age).assertEqual(30);
      expect(newUser3.email).assertContain('johndoe@example.com');
      Done();
    });


    /**
     * @tc.number SUB_EXPORT_INTERFACE_TEST_0700
     * @tc.name ExportInterfaceTest0700
     * @tc.desc test Interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExportInterfaceTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const newUser4: User6Name = {
        name: 'John Doe',
        age: 30,
        email: 'johndoe@example.com'
      };
      expect(newUser4.name).assertContain('John Doe');
      expect(newUser4.age).assertEqual(30);
      expect(newUser4.email).assertContain('johndoe@example.com');
      Done();
    });


    /**
     * @tc.number SUB_EXPORT_INTERFACE_TEST_0800
     * @tc.name ExportInterfaceTest0800
     * @tc.desc test Interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExportInterfaceTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      expect(newUser7.name).assertContain('John Doe');
      expect(newUser7.age).assertEqual(30);
      expect(newUser7.email).assertContain('johndoe@example.com');
      Done();
    });


    /**
     * @tc.number SUB_EXPORT_INTERFACE_TEST_0900
     * @tc.name ExportInterfaceTest0900
     * @tc.desc test Interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExportInterfaceTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      expect(newUser8.newUser7.name).assertContain('John Doe');
      expect(newUser8.newUser7.age).assertEqual(30);
      expect(newUser8.newUser7.email).assertContain('johndoe@example.com');
      Done();
    });

  })
}