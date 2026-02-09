/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import accessibility from '@ohos.accessibility';
import GesturePath from '@ohos.accessibility.GesturePath';
import GesturePoint from '@ohos.accessibility.GesturePoint';
import AccessibilityExtensionAbility  from '@ohos.application.AccessibilityExtensionAbility';
import {ElementAttributeKeys} from '@ohos.application.AccessibilityExtensionAbility';
import { Driver } from '@ohos.UiTest';

const bundleName = 'com.sample.testfora11y';
const triggerAction = 'accessibilityFocus';
const eventType = 'accessibilityFocus';

export default function abilityTest() {
  describe('AccessibilityErrCode', function () {
    let axContext = null;
    let object = null;
    beforeAll(async function (done) {
      let driver = Driver.create();
      console.info(`AccessibilityErrCode: beforeAll starts`);
      done();
    })

    beforeEach(async function (done) {
      console.info(`AccessibilityErrCode: beforeEach starts`);
      done();
    })

    afterEach(async function (done) {
      console.info(`AccessibilityErrCode: afterEach starts`);
      done();
    })

    /* Cases for namespace accessibility */
    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0200
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0200
     * @tc.desc   The parameters input are 'audible' and 'install', test the getAccessibilityExtensionList()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0200', TestType.FUNCTION | Size.SmallTest| Level.LEVEL1, async function (done) {
      console.info('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0200');
      accessibility.getAccessibilityExtensionList('audible', 'install', (err, data) => {
        if (err && err.code != 0) {
          console.error(`AccessibilityErrCodeTest: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0200 has error: ${err.code}`);
          expect(null).assertFail();
          done();
        }
        console.info(`AccessibilityErrCodeTest: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0200 result ${data.length}`);
        expect(Array.isArray(data)).assertEqual(true);
        done();
      });
    })

    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0201
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0201
     * @tc.desc   The parameters input are 'audible' and 'install', test the getAccessibilityExtensionList() function,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0201', TestType.FUNCTION | Size.SmallTest| Level.LEVEL0, async function (done) {
      console.info('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0201');
      accessibility.getAccessibilityExtensionList('audible', 'install').then((result) => {
        console.info(`AccessibilityErrCodeTest: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0201 result ${result.length}`);
        expect(Array.isArray(result)).assertEqual(true);
        done();
      }).catch((err) => {
        console.error(`AccessibilityErrCodeTest: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0201 has error: ${err}`);
        expect(null).assertFail();
        done();
      });
    })

    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0202
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0202
     * @tc.desc   The parameters input are 'generic' and 'install', test the getAccessibilityExtensionList()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0202', TestType.FUNCTION | Size.SmallTest| Level.LEVEL1, async function (done) {
      console.info('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0202');
      accessibility.getAccessibilityExtensionList('generic', 'install', (err, data) => {
        if (err && err.code != 0) {
          console.error(`AccessibilityErrCodeTest: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0202 has error: ${err.code}`);
          expect(null).assertFail();
          done();
        }
        console.info(`AccessibilityErrCodeTest: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0202 result ${data.length}`);
        expect(Array.isArray(data)).assertEqual(true);
        done();
      });
    })

    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0203
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0203
     * @tc.desc   The parameters input are 'generic' and 'install', test the getAccessibilityExtensionList() function,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0203', TestType.FUNCTION | Size.SmallTest| Level.LEVEL1, async function (done) {
      console.info('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0203');
      accessibility.getAccessibilityExtensionList('generic', 'install').then((result) => {
        console.info(`AccessibilityErrCodeTest: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0203 result ${result.length}`);
        expect(Array.isArray(result)).assertEqual(true);
        done();
      }).catch((err) => {
        console.error(`AccessibilityErrCodeTest: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0203 has error: ${err}`);
        expect(null).assertFail();
        done();
      });
    })

    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0204
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0204
     * @tc.desc   The parameters input are 'generic' and 'install', test the getAccessibilityExtensionList()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0204', TestType.FUNCTION | Size.SmallTest| Level.LEVEL1, async function (done) {
      console.info('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0204');
      accessibility.getAccessibilityExtensionList('generic', 'install', (err, data) => {
        if (err && err.code != 0) {
          console.error(`AccessibilityErrCodeTest: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0204 has error: ${err.code}`);
          expect(null).assertFail();
          done();
        }
        console.info(`AccessibilityErrCodeTest: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0204 result ${data.length}`);
        expect(Array.isArray(data)).assertEqual(true);
        done();
      });
    })

    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0205
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0205
     * @tc.desc   The parameters input are 'generic' and 'install', test the getAccessibilityExtensionList() function,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0205', TestType.FUNCTION | Size.SmallTest| Level.LEVEL1, async function (done) {
      console.info('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0205');
      accessibility.getAccessibilityExtensionList('generic', 'install').then((result) => {
        console.info(`AccessibilityErrCodeTest: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0205 result ${result.length}`);
        expect(Array.isArray(result)).assertEqual(true);
        done();
      }).catch((err) => {
        console.error(`AccessibilityErrCodeTest: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0205 has error: ${err}`);
        expect(null).assertFail();
        done();
      });
    })

    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0206
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0206
     * @tc.desc   The parameters input are 'haptic' and 'install', test the getAccessibilityExtensionList()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0206', TestType.FUNCTION | Size.SmallTest| Level.LEVEL1, async function (done) {
      console.info('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0206');
      accessibility.getAccessibilityExtensionList('haptic', 'install', (err, data) => {
        if (err && err.code != 0) {
          console.error(`AccessibilityErrCodeTest: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0206 has error: ${err.code}`);
          expect(null).assertFail();
          done();
        }
        console.info(`AccessibilityErrCodeTest: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0206 result ${data.length}`);
        expect(Array.isArray(data)).assertEqual(true);
        done();
      });
    })

    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0207
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0207
     * @tc.desc   The parameters input are 'haptic' and 'install', test the getAccessibilityExtensionList() function,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0207', TestType.FUNCTION | Size.SmallTest| Level.LEVEL1, async function (done) {
      console.info('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0207');
      accessibility.getAccessibilityExtensionList('haptic', 'install').then((result) => {
        console.info(`AccessibilityErrCodeTest: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0207 result ${result.length}`);
        expect(Array.isArray(result)).assertEqual(true);
        done();
      }).catch((err) => {
        console.error(`AccessibilityErrCodeTest: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0207 has error: ${err}`);
        expect(null).assertFail();
        done();
      });
    })

    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0208
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0208
     * @tc.desc   The parameters input are 'spoken' and 'install', test the getAccessibilityExtensionList()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0208', TestType.FUNCTION | Size.SmallTest| Level.LEVEL1, async function (done) {
      console.info('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0208');
      accessibility.getAccessibilityExtensionList('spoken', 'install', (err, data) => {
        if (err && err.code != 0) {
          console.error(`AccessibilityErrCodeTest: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0208 has error: ${err.code}`);
          expect(null).assertFail();
          done();
        }
        console.info(`AccessibilityErrCodeTest: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0208 result ${data.length}`);
        expect(Array.isArray(data)).assertEqual(true);
        done();
      });
    })

    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0209
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0209
     * @tc.desc   The parameters input are 'spoken' and 'install', test the getAccessibilityExtensionList() function,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0209', TestType.FUNCTION | Size.SmallTest| Level.LEVEL1, async function (done) {
      console.info('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0209');
      accessibility.getAccessibilityExtensionList('spoken', 'install').then((result) => {
        console.info(`AccessibilityErrCodeTest: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0209 result ${result.length}`);
        expect(Array.isArray(result)).assertEqual(true);
        done();
      }).catch((err) => {
        console.error(`AccessibilityErrCodeTest: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0209 has error: ${err}`);
        expect(null).assertFail();
        done();
      });
    })

    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0210
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0210
     * @tc.desc   The parameters input are 'visual' and 'install', test the getAccessibilityExtensionList()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0210', TestType.FUNCTION | Size.SmallTest| Level.LEVEL1, async function (done) {
      console.info('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0210');
      accessibility.getAccessibilityExtensionList('visual', 'install', (err, data) => {
        if (err && err.code != 0) {
          console.error(`AccessibilityErrCodeTest: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0210 has error: ${err.code}`);
          expect(null).assertFail();
          done();
        }
        console.info(`AccessibilityErrCodeTest: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0210 result ${data.length}`);
        expect(Array.isArray(data)).assertEqual(true);
        done();
      });
    })

    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0211
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0211
     * @tc.desc   The parameters input are 'visual' and 'install', test the getAccessibilityExtensionList() function,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0211', TestType.FUNCTION | Size.SmallTest| Level.LEVEL1, async function (done) {
      console.info('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0211');
      accessibility.getAccessibilityExtensionList('visual', 'install').then((result) => {
        console.info(`AccessibilityErrCodeTest: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0211 result ${result.length}`);
        expect(Array.isArray(result)).assertEqual(true);
        done();
      }).catch((err) => {
        console.error(`AccessibilityErrCodeTest: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0211 has error: ${err}`);
        expect(null).assertFail();
        done();
      });
    })

    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0212
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0212
     * @tc.desc   The parameters input are 'all' and 'enable', test the getAccessibilityExtensionList()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0212', TestType.FUNCTION | Size.SmallTest| Level.LEVEL1, async function (done) {
      console.info('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0212');
      accessibility.getAccessibilityExtensionList('all', 'enable', (err, data) => {
        if (err && err.code != 0) {
          console.error(`AccessibilityErrCodeTest: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0212 has error: ${err.code}`);
          expect(null).assertFail();
          done();
        }
        console.info(`AccessibilityErrCodeTest: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0212 result ${data.length}`);
        expect(Array.isArray(data)).assertEqual(true);
        done();
      });
    })

    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0213
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0213
     * @tc.desc   The parameters input are 'all' and 'enable', test the getAccessibilityExtensionList() function,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0213', TestType.FUNCTION | Size.SmallTest| Level.LEVEL1, async function (done) {
      console.info('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0213');
      accessibility.getAccessibilityExtensionList('all', 'enable').then((result) => {
        console.info(`AccessibilityErrCodeTest: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0213 result ${result.length}`);
        expect(Array.isArray(result)).assertEqual(true);
        done();
      }).catch((err) => {
        console.error(`AccessibilityErrCodeTest: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0213 has error: ${err}`);
        expect(null).assertFail();
        done();
      });
    })

    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0214
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0214
     * @tc.desc   The parameters input are 'all' and 'disable', test the getAccessibilityExtensionList()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0214', TestType.FUNCTION | Size.SmallTest| Level.LEVEL1, async function (done) {
      console.info('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0214');
      accessibility.getAccessibilityExtensionList('all', 'disable', (err, data) => {
        if (err && err.code != 0) {
          console.error(`AccessibilityErrCodeTest: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0214 has error: ${err.code}`);
          expect(null).assertFail();
          done();
        }
        console.info(`AccessibilityErrCodeTest: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0214 result ${data.length}`);
        expect(Array.isArray(data)).assertEqual(true);
        done();
      });
    })

    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0215
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0215
     * @tc.desc   The parameters input are 'all' and 'disable', test the getAccessibilityExtensionList() function,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0215', TestType.FUNCTION | Size.SmallTest| Level.LEVEL1, async function (done) {
      console.info('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0215');
      accessibility.getAccessibilityExtensionList('all', 'disable').then((result) => {
        console.info(`AccessibilityErrCodeTest: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0215 result ${result.length}`);
        expect(Array.isArray(result)).assertEqual(true);
        done();
      }).catch((err) => {
        console.error(`AccessibilityErrCodeTest: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0215 has error: ${err}`);
        expect(null).assertFail();
        done();
      });
    })

    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0216
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0216
     * @tc.desc   The parameters input are 'all' and 'install', test the getAccessibilityExtensionList()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0216', TestType.FUNCTION | Size.SmallTest| Level.LEVEL1, async function (done) {
      console.info('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0216');
      accessibility.getAccessibilityExtensionList('all', 'install', (err, data) => {
        if (err && err.code != 0) {
          console.error(`AccessibilityErrCodeTest: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0216 has error: ${err.code}`);
          expect(null).assertFail();
          done();
        }
        console.info(`AccessibilityErrCodeTest: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0216 result ${data.length}`);
        expect(Array.isArray(data)).assertEqual(true);
        done();
      });
    })

    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0217
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0217
     * @tc.desc   The parameters input are 'all' and 'install', test the getAccessibilityExtensionList() function,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0217', TestType.FUNCTION | Size.SmallTest| Level.LEVEL1, async function (done) {
      console.info('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0217');
      accessibility.getAccessibilityExtensionList('all', 'install').then((result) => {
        console.info(`AccessibilityErrCodeTest: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0217 result ${result.length}`);
        expect(Array.isArray(result)).assertEqual(true);
        done();
      }).catch((err) => {
        console.error(`AccessibilityErrCodeTest: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0217 has error: ${err}`);
        expect(null).assertFail();
        done();
      });
    })

    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0300
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0300
     * @tc.desc   test Accessibility EventInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0300', TestType.FUNCTION | Size.SmallTest| Level.LEVEL1, async function (done) {
      let eventInfo = new accessibility.EventInfo({
        'type': 'click',
        'bundleName': 'com.example.MyApplication',
        'triggerAction': 'click'
      });
      expect(eventInfo != null).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0301
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0301
     * @tc.desc   The parameters input are '' and 'install', test the getAccessibilityExtensionList() function,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0301', TestType.FUNCTION | Size.SmallTest| Level.LEVEL1, async function (done) {
      console.info('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0301');
      try {
        let abilityType ;
        accessibility.getAccessibilityExtensionList(abilityType, 'install', (err, data) => {
          if (err && err.code != 0) {
            console.error(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0301 has error: ${err.code}`);
            expect(err.code).assertEqual(401);
            done();
          }else{
            console.info(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0301 result ${data.length}`);
            expect(Array.isArray(data)).assertEqual(false);
            done();
          }
        });
      } catch (exception) {
        console.error(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0301 has error: ${exception.code}`);
        expect(exception.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0302
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0302
     * @tc.desc   The parameters input are null and 'install', test the getAccessibilityExtensionList() function,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0302', TestType.FUNCTION | Size.SmallTest| Level.LEVEL1, async function (done) {
      console.info('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0302');
      try {
        let abilityType = null;
        accessibility.getAccessibilityExtensionList(abilityType, 'install', (err, data) => {
          if (err && err.code != 0) {
            console.error(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0302 has error: ${err.code}`);
            expect(err.code).assertEqual(401);
            done();
          }else{
            console.info(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0302 result ${data.length}`);
            expect(Array.isArray(data)).assertEqual(false);
            done();
          }
        });
      } catch (exception) {
        console.error(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0302 has error: ${exception.code}`);
        expect(exception.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0303
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0303
     * @tc.desc   The parameters input are 'all' and '', test the getAccessibilityExtensionList() function,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0303', TestType.FUNCTION | Size.SmallTest| Level.LEVEL1, async function (done) {
      console.info('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0303');
      try {
        let abilityState ;
        accessibility.getAccessibilityExtensionList('all', abilityState, (err, data) => {
          if (err && err.code != 0) {
            console.error(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0303 has error: ${err.code}`);
            expect(err.code).assertEqual(401);
            done();
          }else{
            console.info(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0303 result ${data.length}`);
            expect(Array.isArray(data)).assertEqual(false);
            done();
          }
        });
      } catch (exception) {
        console.error(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0303 has error: ${exception.code}`);
        expect(exception.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0304
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0304
     * @tc.desc   The parameters input are 'all' and null, test the getAccessibilityExtensionList() function,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0304', TestType.FUNCTION | Size.SmallTest| Level.LEVEL1, async function (done) {
      console.info('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0304');
      try {
        let abilityState = null;
        accessibility.getAccessibilityExtensionList('all', abilityState, (err, data) => {
          if (err && err.code != 0) {
            console.error(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0304 has error: ${err.code}`);
            expect(err.code).assertEqual(401);
            done();
          }else{
            console.info(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0304 result ${data.length}`);
            expect(Array.isArray(data)).assertEqual(false);
            done();
          }
        });
      } catch (exception) {
        console.error(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0304 has error: ${exception.code}`);
        expect(exception.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0305
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0305
     * @tc.desc   The parameters input are '' and 'install', test the getAccessibilityExtensionList() function,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0305', TestType.FUNCTION | Size.SmallTest| Level.LEVEL1, async function (done) {
      console.info('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0305');
      try {
        let abilityType ;
        accessibility.getAccessibilityExtensionList(abilityType, 'install').then((result) => {
          console.info(`AccessibilityErrCodeTest: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0305 result ${result.length}`);
          expect(Array.isArray(result)).assertEqual(false);
          done();
        }).catch((err) => {
          console.error(`AccessibilityErrCodeTest: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0305 has error: ${err}`);
          expect(err.code).assertEqual(401);
          done();
        })
      } catch (exception) {
        console.error(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0305 has error: ${exception.code}`);
        expect(exception.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0306
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0306
     * @tc.desc   The parameters input are null and 'install', test the getAccessibilityExtensionList() function,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0306', TestType.FUNCTION | Size.SmallTest| Level.LEVEL1, async function (done) {
      console.info('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0306');
      try {
        let abilityType = null;
        accessibility.getAccessibilityExtensionList(abilityType, 'install').then((result) => {
          console.info(`AccessibilityErrCodeTest: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0305 result ${result.length}`);
          expect(Array.isArray(result)).assertEqual(false);
          done();
        }).catch((err) => {
          console.error(`AccessibilityErrCodeTest: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0305 has error: ${err}`);
          expect(err.code).assertEqual(401);
          done();
        })
      } catch (exception) {
        console.error(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0305 has error: ${exception.code}`);
        expect(exception.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0307
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0307
     * @tc.desc   The parameters input are 'all' and '', test the getAccessibilityExtensionList() function,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0307', TestType.FUNCTION | Size.SmallTest| Level.LEVEL1, async function (done) {
      console.info('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0307');
      try {
        let abilityState ;
        accessibility.getAccessibilityExtensionList('all', abilityState).then((result) => {
          console.info(`AccessibilityErrCodeTest: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0307 result ${result.length}`);
          expect(Array.isArray(result)).assertEqual(false);
          done();
        }).catch((err) => {
          console.error(`AccessibilityErrCodeTest: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0307 has error: ${err}`);
          expect(err.code).assertEqual(401);
          done();
        })
      } catch (exception) {
        console.error(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0307 has error: ${exception.code}`);
        expect(exception.code).assertEqual(401);
        done();
      }
    });


    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0308
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0308
     * @tc.desc   The parameters input are 'all' and null, test the getAccessibilityExtensionList() function,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0308', TestType.FUNCTION | Size.SmallTest| Level.LEVEL1, async function (done) {
      console.info('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0308');
      try {
        let abilityState = null;
        accessibility.getAccessibilityExtensionList('all', abilityState).then((result) => {
          console.info(`AccessibilityErrCodeTest: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0308 result ${result.length}`);
          expect(Array.isArray(result)).assertEqual(false);
          done();
        }).catch((err) => {
          console.error(`AccessibilityErrCodeTest: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0308 has error: ${err}`);
          expect(err.code).assertEqual(401);
          done();
        })
      } catch (exception) {
        console.error(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0308 has error: ${exception.code}`);
        expect(exception.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0800
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0800
     * @tc.desc   test Accessibility SendEvent CallBack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0800', TestType.FUNCTION | Size.SmallTest| Level.LEVEL1, async function (done) {
      let event = null;
      accessibility.sendEvent(event, (err, data) => {
        if (err) {
          console.error('failed to sendEvent because ' + JSON.stringify(err));
          done();
          return;
        }
        console.info('success data:sendEvent : ' + JSON.stringify(data))
        expect(null).assertFail();
        done();
      })
    })
    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0100
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0100
     * @tc.desc   test Ability Capability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0100', TestType.FUNCTION | Size.SmallTest| Level.LEVEL1, async function (done) {
      accessibility.getAbilityLists('audible', 'enable', (err, data) => {
        if (err) {
          console.error('failed to get accessibility extension list because ' + JSON.stringify(err));
          done();
          return;
        }
        for (let accessibilityAbilityInfo of data) {
          if (accessibilityAbilityInfo.bundleName == 'audible') {
            expect(accessibilityAbilityInfo.capabilities.length >= 0).assertTrue();
            expect(accessibilityAbilityInfo.abilityTypes.length >= 0).assertTrue();
            expect(accessibilityAbilityInfo.eventTypes.length >= 0).assertTrue();
            expect(accessibilityAbilityInfo.targetBundleNames.length >= 0).assertTrue();
            expect(accessibilityAbilityInfo.bundleName != null).assertTrue();
            expect(accessibilityAbilityInfo.description != null).assertTrue();
            expect(accessibilityAbilityInfo.id != null).assertTrue();
            expect(accessibilityAbilityInfo.name != null).assertTrue();
            expect(accessibilityAbilityInfo.needHide != null).assertTrue();
            expect(accessibilityAbilityInfo.label != null).assertTrue();
            for (let capability of accessibilityAbilityInfo.capabilities) {
              let cap = capability.toString();
              expect(cap == 'retrieve' ||
                cap == 'touchGuide' ||
                cap == 'keyEventObserver' ||
                cap == 'zoom' ||
                cap == 'gesture')
                .assertTrue();
            }
          }
        }
        console.info('get accessibility extension list success');
        done();
      })
    })

    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_1000
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_1000
     * @tc.desc   test GesturePath And GesturePoint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_1000', TestType.FUNCTION | Size.SmallTest| Level.LEVEL0, async function (done) {
      let gesturePath = new GesturePath.GesturePath(20);
      let gesturePoint = new GesturePoint.GesturePoint(1, 2);
      gesturePath.points.push(gesturePoint);
      expect(gesturePath.points.length != 0).assertTrue();
      expect(gesturePath.durationTime == 20).assertTrue();
      expect(gesturePoint.positionX == 1).assertTrue();
      expect(gesturePoint.positionY == 2).assertTrue();
      done();
    })

    function init() {
      class MainAbility extends AccessibilityExtensionAbility {
        onConnect(): void {
          console.log('AxExtensionAbility onConnect');
          axContext = this.context;
        }

        onDisconnect() {
          console.log('AxExtensionAbility onDisconnect');
        }

        onAccessibilityEvent(event) {
          console.log('AxExtensionAbility onAccessibilityEvent');
          expect(event.eventType != null).assertTrue();
          expect(event.target != null).assertTrue();
          expect(event.timeStamp != null).assertTrue();
          expect(event.elementId != null).assertTrue();
          expect(event.textAnnouncedForAccessibility != null).assertTrue();
        }

        onKeyEvent(keyEvent) {
          console.log('AxExtensionAbility onKeyEvent');
          if (keyEvent.keyCode == 22) {
            console.log('AxExtensionAbility onKeyEvent: intercept 22');
            return true;
          }
          return false;
        }
      }

      object = new MainAbility();
      object.onConnect();
    }

    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0900
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0900
     * @tc.desc   test AccessibilitySetTargetBundleName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0900', TestType.FUNCTION | Size.SmallTest| Level.LEVEL1, async function (done) {
      init();
      if (axContext != null) {
        let targetNames = ['com.ohos.xyz'];
        try {
          axContext.setTargetBundleName(targetNames).then(() => {
            done();
          }).catch((err) => {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0900 err:' + JSON.stringify(err));
            done();
          });
        } catch (exception) {
          console.error('failed to set target bundle names, because ' + JSON.stringify(exception));
          expect(false).assertTrue();
          done();
        }
      } else {
        console.log('axContext null');
        done();
      }
    })

    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0901
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0901
     * @tc.desc   test AccessibilitySetTargetBundleName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0901', TestType.FUNCTION | Size.SmallTest| Level.LEVEL1, async function (done) {
      if (axContext != null) {
        let targetNames = ['com.ohos.xyz'];
        try {
          axContext.setTargetBundleName(targetNames, (err, data) => {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0901 err' + JSON.stringify(err) + ' data:' + JSON.stringify(data));
            done();
          });
        } catch (exception) {
          console.error('failed to set target bundle names, because ' + JSON.stringify(exception));
          expect(false).assertTrue();
          done();
        }
      } else {
        console.log('axContext null');
        done();
      }
    })

    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0400
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0400
     * @tc.desc   test AccessibilityGetFocusElement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0400', TestType.FUNCTION | Size.SmallTest| Level.LEVEL0, async function (done) {
      if (axContext != null) {
        try {
          axContext.getFocusElement().then((rootElement) => {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0400 rootElement:' + JSON.stringify(rootElement));
            rootElement.attributeNames().then((data) => {
              console.log('get attribute names success');

            }).catch((err) => {
              console.log('failed to get attribute names, because ' + JSON.stringify(err));
            });
            rootElement.attributeValue('name').then((data) => {
              console.log('get attribute value by name success');
            }).catch((err) => {
              console.log('failed to get attribute value, because ' + JSON.stringify(err));
            });
            rootElement.actionNames().then((data) => {
              console.log('get action names success');
            }).catch((err) => {
              console.log('failed to get action names because ' + JSON.stringify(err));
            });
            rootElement.performAction('action').then((data) => {
              console.info('perform action success');
            }).catch((err) => {
              console.log('failed to perform action, because ' + JSON.stringify(err));
            });
            rootElement.getCursorPosition().then((data: number) => {
              console.info('get cursorPosition success');
            }).catch((err) => {
              console.log('failed to getCursorPosition, because ' + JSON.stringify(err));
            });
            done();
          }).catch((err) => {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0400 err:' + JSON.stringify(err));
            done();
          });
        } catch (exception) {
          console.error('failed to get focus element, because ' + JSON.stringify(exception));
          expect(false).assertTrue();
          done();
        }
      } else {
        console.log('axContext null');
        done();
      }
    })
    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0401
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0401
     * @tc.desc   test AccessibilityGetFocusElement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0401', TestType.FUNCTION | Size.SmallTest| Level.LEVEL0, async function (done) {
      if (axContext != null) {
        try {
          axContext.getFocusElement((err, rootElement) => {
            if (err) {
              console.error('failed to get focus element, because ' + JSON.stringify(err));
              done();
              return;
            }
            rootElement.attributeNames((err, ElementAttributeValue: ElementAttributeKeys[]) => {
              if (err) {
                console.error('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0401 failed to get element attributeNames, because ' + JSON.stringify(err));
                done();
                return;
              }
              console.info('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0401 data:' + JSON.stringify(ElementAttributeValue));
              expect(ElementAttributeValue.indexOf("accessibilityFocused") != -1).assertTrue();
              expect(ElementAttributeValue.indexOf("bundleName") != -1).assertTrue();
              expect(ElementAttributeValue.indexOf("checkable") != -1).assertTrue();
              expect(ElementAttributeValue.indexOf("checked") != -1).assertTrue();
              expect(ElementAttributeValue.indexOf("children") != -1).assertTrue();
              expect(ElementAttributeValue.indexOf("clickable") != -1).assertTrue();
              expect(ElementAttributeValue.indexOf("componentId") != -1).assertTrue();
              expect(ElementAttributeValue.indexOf("componentType") != -1).assertTrue();
              expect(ElementAttributeValue.indexOf("contents") != -1).assertTrue();
              expect(ElementAttributeValue.indexOf("currentIndex") != -1).assertTrue();
              expect(ElementAttributeValue.indexOf("description") != -1).assertTrue();
              expect(ElementAttributeValue.indexOf("editable") != -1).assertTrue();
              expect(ElementAttributeValue.indexOf("endIndex") != -1).assertTrue();
              expect(ElementAttributeValue.indexOf("error") != -1).assertTrue();
              expect(ElementAttributeValue.indexOf("focusable") != -1).assertTrue();
              expect(ElementAttributeValue.indexOf("hintText") != -1).assertTrue();
              expect(ElementAttributeValue.indexOf("inputType") != -1).assertTrue();
              expect(ElementAttributeValue.indexOf("inspectorKey") != -1).assertTrue();
              expect(ElementAttributeValue.indexOf("isEnable") != -1).assertTrue();
              expect(ElementAttributeValue.indexOf("isHint") != -1).assertTrue();
              expect(ElementAttributeValue.indexOf("isFocused") != -1).assertTrue();
              expect(ElementAttributeValue.indexOf("isPassword") != -1).assertTrue();
              expect(ElementAttributeValue.indexOf("isVisible") != -1).assertTrue();
              expect(ElementAttributeValue.indexOf("itemCount") != -1).assertTrue();
              expect(ElementAttributeValue.indexOf("lastContent") != -1).assertTrue();
              expect(ElementAttributeValue.indexOf("longClickable") != -1).assertTrue();
              expect(ElementAttributeValue.indexOf("pageId") != -1).assertTrue();
              expect(ElementAttributeValue.indexOf("parent") != -1).assertTrue();
              expect(ElementAttributeValue.indexOf("pluralLineSupported") != -1).assertTrue();
              expect(ElementAttributeValue.indexOf("rect") != -1).assertTrue();
              expect(ElementAttributeValue.indexOf("resourceName") != -1).assertTrue();
              expect(ElementAttributeValue.indexOf("scrollable") != -1).assertTrue();
              expect(ElementAttributeValue.indexOf("selected") != -1).assertTrue();
              expect(ElementAttributeValue.indexOf("startIndex") != -1).assertTrue();
              expect(ElementAttributeValue.indexOf("text") != -1).assertTrue();
              expect(ElementAttributeValue.indexOf("textLengthLimit") != -1).assertTrue();
              expect(ElementAttributeValue.indexOf("textMoveUnit") != -1).assertTrue();
              expect(ElementAttributeValue.indexOf("triggerAction") != -1).assertTrue();
              expect(ElementAttributeValue.indexOf("valueMax") != -1).assertTrue();
              expect(ElementAttributeValue.indexOf("valueMin") != -1).assertTrue();
              expect(ElementAttributeValue.indexOf("valueNow") != -1).assertTrue();
              expect(ElementAttributeValue.indexOf("windowId") != -1).assertTrue();
              expect(ElementAttributeValue.indexOf("textType") != -1).assertTrue();
              expect(ElementAttributeValue.indexOf("offset") != -1).assertTrue();
              expect(ElementAttributeValue.indexOf("hotArea") != -1).assertTrue();
              expect(ElementAttributeValue.indexOf("accessibilityText") != -1).assertTrue();
              expect(ElementAttributeValue.indexOf("customComponentType") != -1).assertTrue();
              expect(ElementAttributeValue.indexOf("accessibilityNextFocusId") != -1).assertTrue();
              expect(ElementAttributeValue.indexOf("accessibilityPreviousFocusId") != -1).assertTrue();
              expect(ElementAttributeValue.indexOf("extraInfo") != -1).assertTrue();
              expect(ElementAttributeValue.indexOf("accessibilityScrollable") != -1).assertTrue();
            });
            rootElement.actionNames((err, data) => {
              console.info('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0401 err' + JSON.stringify(err) + ' data:' + JSON.stringify(data));
            });
            rootElement.performAction('action', (err, data) => {
              console.info('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0401 err' + JSON.stringify(err) + ' data:' + JSON.stringify(data));
            });
            rootElement.getCursorPosition((err, data) => {
              console.info('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0401 err' + JSON.stringify(err) + ' data:' + JSON.stringify(data));
            });
            rootElement.attributeValue('bundleName', (err, data: string) => {
              if (err && err.code) {
                console.error(`failed to get attribute value, Code is ${err.code}, message is ${err.message}`);
                return;
              }
              console.info(`Succeeded in get attribute value, ${JSON.stringify(data)}`);
            });
            let actionName = 'action';
            let parameters = {
              'setText': 'test text'
            };
            rootElement.performAction(actionName, parameters, (err, data) => {
              console.info('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0401 err' + JSON.stringify(err) + ' data:' + JSON.stringify(data));
            });
            done();
          });
        } catch (exception) {
          console.error('failed to get focus element, because ' + JSON.stringify(exception));
          expect(false).assertTrue();
          done();
        }
      } else {
        console.log('axContext null');
        done();
      }
    })
    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0402
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0402
     * @tc.desc   test AccessibilityGetFocusElement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0402', TestType.FUNCTION | Size.SmallTest| Level.LEVEL1, async function (done) {
      if (axContext != null) {
        let isAccessibilityFocus = true;
        try {
          axContext.getFocusElement(isAccessibilityFocus, (err, rootElement) => {
            if (err) {
              console.error('failed to get focus element, because ' + JSON.stringify(err));
              done();
              return;
            }
            rootElement.findElement('content', 'keyword').then((data) => {
              console.log('data' + JSON.stringify(data));
            }).catch((err) => {
              console.log('failed to find element, because ' + JSON.stringify(err));
            });
            rootElement.findElement('content', 'keyword', (err, data) => {
              console.info('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0402 err' + JSON.stringify(err) + ' data:' + JSON.stringify(data));
            });
            rootElement.findElement('focusType', 'normal').then((data) => {
              console.log('data' + JSON.stringify(data));
            }).catch((err) => {
              console.log('failed to find element, because ' + JSON.stringify(err));
            });
            rootElement.findElement('focusType', 'normal', (err, data) => {
              console.info('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0402 err' + JSON.stringify(err) + ' data:' + JSON.stringify(data));
            });
            rootElement.findElement('focusDirection', 'up').then((data) => {
              console.log('data' + JSON.stringify(data));
            }).catch((err) => {
              console.log('failed to find element, because ' + JSON.stringify(err));
            });
            rootElement.findElement('focusDirection', 'up', (err, data) => {
              console.info('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0402 err' + JSON.stringify(err) + ' data:' + JSON.stringify(data));
            });
            done();
          });
        } catch (exception) {
          console.error('failed to get focus element, because ' + JSON.stringify(exception));
          expect(false).assertTrue();
          done();
        }
      } else {
        console.log('axContext null');
        done();
      }
    })

    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0403
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0403
     * @tc.desc   test AccessibilityGetCursorPosition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0403', TestType.FUNCTION | Size.SmallTest| Level.LEVEL1, async function (done) {
      if (axContext != null) {
        let isAccessibilityFocus = true;
        try {
          axContext.getFocusElement(isAccessibilityFocus, (err, rootElement) => {
            if (err) {
              console.error('failed to get focus element, because ' + JSON.stringify(err));
              done();
              return;
            }
            rootElement.findElement('id', '-100000').then((subElement) => {
              console.log('subElement' + JSON.stringify(subElement));
              subElement.getCursorPosition().then((data: number) => {
                console.info('get cursorPosition success');
                expect(data == -1).assertTrue();
              }).catch((err) => {
                console.log('failed to getCursorPosition, because ' + JSON.stringify(err));
                expect(false).assertTrue();
                done();
              });
              done();
            }).catch((err) => {
              console.log('failed to find element, because ' + JSON.stringify(err));
              expect(false).assertTrue();
              done();
            });
          });
        } catch (exception) {
          console.error('failed to get focus element, because ' + JSON.stringify(exception));
          expect(false).assertTrue();
          done();
        }
      } else {
        console.log('axContext null');
        done();
      }
    })

    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0500
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0500
     * @tc.desc   test AccessibilityGetWindowRootElement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0500', TestType.FUNCTION | Size.SmallTest| Level.LEVEL0, async function (done) {
      if (axContext != null) {
        try {
          axContext.getWindowRootElement().then((data) => {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0500 data:' + JSON.stringify(data));
            done();
          }).catch((err) => {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0500 err:' + JSON.stringify(err));
            done();
          });
        } catch (exception) {
          console.error('failed to get root element of the window, ' + JSON.stringify(exception));
          expect(false).assertTrue();
          done();
        }
      } else {
        console.log('axContext null');
        done();
      }
    })


    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0501
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0501
     * @tc.desc   test AccessibilityGetWindowRootElement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0501', TestType.FUNCTION | Size.SmallTest| Level.LEVEL0, async function (done) {
      if (axContext != null) {
        try {
          axContext.getWindowRootElement((err, data) => {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0501 err' + JSON.stringify(err) + ' data:' + JSON.stringify(data));
            done();
          });
        } catch (exception) {
          console.error('failed to get root element of the window, because ' + JSON.stringify(exception));
          expect(false).assertTrue();
          done();
        }
      } else {
        console.log('axContext null');
        done();
      }
    })


    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0502
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0502
     * @tc.desc   test AccessibilityGetWindowRootElement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0502', TestType.FUNCTION | Size.SmallTest| Level.LEVEL1, async function (done) {
      if (axContext != null) {
        let windowId = 10;
        try {
          axContext.getWindowRootElement(windowId, (err, data) => {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0502 err' + JSON.stringify(err) + ' data:' + JSON.stringify(data));
            done();
          });
        } catch (exception) {
          console.error('failed to get root element of the window, because ' + JSON.stringify(exception));
          expect(false).assertTrue();
          done();
        }
      } else {
        console.log('axContext null');
        done();
      }
    })


    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0600
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0600
     * @tc.desc   test AccessibilityGetWindows
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0600', TestType.FUNCTION | Size.SmallTest| Level.LEVEL0, async function (done) {
      if (axContext != null) {
        try {
          axContext.getWindows().then((data) => {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0600  data:' + JSON.stringify(data));
            data[0].attributeNames().then((data: ElementAttributeKeys[]) => {
              console.log('get attribute names success');
              if (data != null) {
                expect(data.indexOf("isActive") != -1).assertTrue();
                expect(data.indexOf("screenRect") != -1).assertTrue();
                expect(data.indexOf("layer") != -1).assertTrue();
                expect(data.indexOf("type") != -1).assertTrue();
                expect(data.indexOf("rootElement") != -1).assertTrue();
                expect(data.indexOf("windowId") != -1).assertTrue();
              }
            }).catch((err) => {
              console.log('failed to get attribute names, because ' + JSON.stringify(err));
            });
            done();
          }).catch((err) => {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0600 err' + JSON.stringify(err));
            done();
          });
        } catch (exception) {
          console.error('failed to get windows, because ' + JSON.stringify(exception));
          expect(false).assertTrue();
          done();
        }
      } else {
        console.log('axContext null');
        done();
      }
    })


    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0601
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0601
     * @tc.desc   test AccessibilityGetWindows
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0601', TestType.FUNCTION | Size.SmallTest| Level.LEVEL0, async function (done) {
      if (axContext != null) {
        try {
          axContext.getWindows((err, data) => {
            if (err) {
              console.error('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0601 failed to getWindows, because ' + JSON.stringify(err));
              done();
              return;
            }
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0601  data:' + JSON.stringify(data));
            if (data != null) {
              data[0].attributeValue('screenRect').then((data) => {
                console.log('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0601 get attribute value by name success');
                expect(data.left != -1).assertTrue();
                expect(data.top != -1).assertTrue();
                expect(data.width != -1).assertTrue();
                expect(data.height != -1).assertTrue();
              }).catch((err) => {
                console.log('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0601 failed to get attribute value, because ' + JSON.stringify(err));
              });
            }
            done();
          });
        } catch (exception) {
          console.error('failed to get windows, because ' + JSON.stringify(exception));
          expect(false).assertTrue();
          done();
        }
      } else {
        console.log('axContext null');
        done();
      }
    })


    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0602
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0602
     * @tc.desc   test AccessibilityGetWindows
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0602', TestType.FUNCTION | Size.SmallTest| Level.LEVEL1, async function (done) {
      if (axContext != null) {
        let displayId = 10;
        try {
          axContext.getWindows(displayId, (err, data) => {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0602 err' + JSON.stringify(err) + ' data:' + JSON.stringify(data));
            done();
          });
        } catch (exception) {
          console.error('failed to get windows, because ' + JSON.stringify(exception));
          expect(false).assertTrue();
          done();
        }
      } else {
        console.log('axContext null');
        done();
      }
    })


    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0700
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0700
     * @tc.desc   test AccessibilityInjectGesture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0700', TestType.FUNCTION | Size.SmallTest| Level.LEVEL1, async function (done) {
      if (axContext != null) {
        let gesturePath = new GesturePath.GesturePath(100);
        try {
          for (let i = 0; i < 10; i++) {
            let gesturePoint = new GesturePoint.GesturePoint(100, i * 200);
            gesturePath.points.push(gesturePoint);
          }
          axContext.injectGesture(gesturePath).then(() => {
            done();
          }).catch((err) => {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0700 err' + JSON.stringify(err));
            done();
          });
        } catch (exception) {
          console.error('failed to inject gesture, because ' + JSON.stringify(exception));
          expect(false).assertTrue();
          done();
        }
      } else {
        console.log('axContext null');
        done();
      }
    })


    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0701
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0701
     * @tc.desc   test AccessibilityInjectGesture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0701', TestType.FUNCTION | Size.SmallTest| Level.LEVEL1, async function (done) {
      if (axContext != null) {
        let gesturePath = new GesturePath.GesturePath(100);
        try {
          for (let i = 0; i < 10; i++) {
            let gesturePoint = new GesturePoint.GesturePoint(100, i * 200);
            gesturePath.points.push(gesturePoint);
          }
          axContext.injectGesture(gesturePath, (err, data) => {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0701 err' + JSON.stringify(err) + ' data:' + JSON.stringify(data));
            done();
          });
        } catch (exception) {
          console.error('failed to inject gesture, because ' + JSON.stringify(exception));
          expect(false).assertTrue();
          done();
        }
      } else {
        console.log('axContext null');
        done();
      }
    })
    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0702
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0702
     * @tc.desc   test AccessibilityInjectGesture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0702', TestType.FUNCTION | Size.SmallTest| Level.LEVEL1, async function (done) {
      if (axContext != null) {
        let gesturePath = new GesturePath.GesturePath(100);
        try {
          for (let i = 0; i < 10; i++) {
            let gesturePoint = new GesturePoint.GesturePoint(100, i * 200);
            gesturePath.points.push(gesturePoint);
          }
          axContext.injectGestureSync(gesturePath);
        } catch (exception) {
          console.error('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0702  failed to inject gesture, because ' + JSON.stringify(exception));
          expect(false).assertTrue();
          done();
        }
      } else {
        console.log('axContext null');
        done();
      }
    })

  })
}