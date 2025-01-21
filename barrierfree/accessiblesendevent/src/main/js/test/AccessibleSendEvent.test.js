/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
import accessibility from '@ohos.accessibility'

const bundleName = 'com.sample.testfora11y';
const triggerAction = 'accessibilityFocus';
const eventType = 'accessibilityFocus';

export default function AccessibleSendEvent() {
describe('AccessibleSendEvent', function () {

    beforeEach(async function (done) {
        console.info(`AccessibleSendEvent: beforeEach starts`);
        done();
    })

    afterEach(async function (done) {
        console.info(`AccessibleSendEvent: afterEach starts`);
        done();
    })
  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_0100
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_0100
    * @tc.desc    The beginIndex of EventInfo is 1, test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_0100', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_0100 starts`);

    let beginIndex = 1;
    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      triggerAction : triggerAction,
      beginIndex : beginIndex,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_0100 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_0200
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_0200
    * @tc.desc    The beginIndex of EventInfo is 0, test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_0200', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_0200 starts`);

    let beginIndex = 0;
    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      triggerAction : triggerAction,
      beginIndex : beginIndex,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_0200 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_0300
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_0300
    * @tc.desc    The beginIndex of EventInfo is -1, test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_0300', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_0300 starts`);

    let beginIndex = -1;
    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      triggerAction : triggerAction,
      beginIndex : beginIndex,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_0300 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })


  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_0400
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_0400
    * @tc.desc    The bundleName of EventInfo is 'com.ixaa.testfora11y', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_0400', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_0400 starts`);

    let localBundleName = 'com.ixaa.testfora11y';
    let jsonObj = {
      type : eventType,
      bundleName : localBundleName,
      triggerAction : triggerAction,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_0400 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_0500
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_0500
    * @tc.desc    The bundleName of EventInfo is '', test sendEvent() function
    *             The result of sendEvent() should be equal to a rejected promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_0500', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_0500 starts`);

    let localBundleName = '';
    let jsonObj = {
      type : eventType,
      bundleName : localBundleName,
      triggerAction : triggerAction,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) =>{
        console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_0500 result ${result}`);
        expect(null).assertFail();
        done();
    }).catch((err) => {
        console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_0500 has error: ${err}`);
        expect(true).assertTrue();
        done();
    });
  })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_0600
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_0600
    * @tc.desc    The bundleName of EventInfo is null, test sendEvent() function
    *             The result of sendEvent() should be equal to a rejected promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_0600', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_0600 starts`);

    let localBundleName = null;
    let jsonObj = {
      type : eventType,
      bundleName : localBundleName,
      triggerAction : triggerAction,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) =>{
        console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_0600 result ${result}`);
        expect(null).assertFail();
        done();
    }).catch((err) => {
        console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_0600 has error: ${err}`);
        expect(true).assertTrue();
        done();
    });
  })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_0700
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_0700
    * @tc.desc    The componentType of EventInfo is 'button', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_0700', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_0700 starts`);

    let componentType = 'button';
    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      componentType : componentType,
      triggerAction : triggerAction,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_0700 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_0800
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_0800
    * @tc.desc    The componentType of EventInfo is '', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_0800', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_0800 starts`);

    let componentType = '';
    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      componentType : componentType,
      triggerAction : triggerAction,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_0800 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_0900
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_0900
    * @tc.desc    The componentType of EventInfo is null, test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_0900', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_0900 starts`);

    let componentType = null;
    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      componentType : componentType,
      triggerAction : triggerAction,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_0900 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_1100
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_1100
    * @tc.desc    The contents of EventInfo is ['1'], test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_1100', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_1100 starts`);

    let contents = ['1'];
    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      triggerAction : triggerAction,
      contents : contents,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_1100 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_1200
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_1200
    * @tc.desc    The contents of EventInfo is [], test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_1200', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_1200 starts`);

    let contents = [];
    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      triggerAction : triggerAction,
      contents : contents,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_1200 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
      * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_1300
      * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_1300
      * @tc.desc    The currentIndex of EventInfo is 1, test sendEvent() function
      *             The result of sendEvent() should be equal to a promise of undefined
      *             Another test point is to test whether the modified constructor (EventInfo)
      *             works correctly.
      * @tc.size    SmallTest
      * @tc.type    User
      */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_1300', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_1300 starts`);

    let currentIndex = 1;
    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      triggerAction : triggerAction,
      currentIndex : currentIndex,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_1300 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_1400
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_1400
    * @tc.desc    The currentIndex of EventInfo is 0, test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_1400', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_1400 starts`);

    let currentIndex = 0;
    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      triggerAction : triggerAction,
      currentIndex : currentIndex,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_1400 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_1500
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_1500
    * @tc.desc    The currentIndex of EventInfo is -1, test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_1500', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_1500 starts`);

    let currentIndex = -1;
    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      triggerAction : triggerAction,
      currentIndex : currentIndex,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_1500 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })


  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_1600
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_1600
    * @tc.desc    The description of EventInfo is '1', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_1600', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_1600 starts`);

    let description = '1';
    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      description : description,
      triggerAction : triggerAction,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_1600 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_1700
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_1700
    * @tc.desc    The description of EventInfo is '', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_1700', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_1700 starts`);

    let description = '';
    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      description : description,
      triggerAction : triggerAction,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_1700 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_1800
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_1800
    * @tc.desc    The description of EventInfo is null, test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_1800', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_1800 starts`);

    let description = null;
    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      description : description,
      triggerAction : triggerAction,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_1800 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })


  /*
      * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_1900
      * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_1900
      * @tc.desc    The endIndex of EventInfo is 1, test sendEvent() function
      *             The result of sendEvent() should be equal to a promise of undefined
      *             Another test point is to test whether the modified constructor (EventInfo)
      *             works correctly.
      * @tc.size    SmallTest
      * @tc.type    User
      */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_1900', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_1900 starts`);

    let endIndex = 1;
    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      triggerAction : triggerAction,
      endIndex : endIndex,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_1900 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_2000
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_2000
    * @tc.desc    The endIndex of EventInfo is 0, test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_2000', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_2000 starts`);

    let endIndex = 0;
    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      triggerAction : triggerAction,
      endIndex : endIndex,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_2000 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_2100
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_2100
    * @tc.desc    The endIndex of EventInfo is -1, test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_2100', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_2100 starts`);

    let endIndex = -1;
    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      triggerAction : triggerAction,
      endIndex : endIndex,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_2100 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
      * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_2200
      * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_2200
      * @tc.desc    The itemCount of EventInfo is 1, test sendEvent() function
      *             The result of sendEvent() should be equal to a promise of undefined
      *             Another test point is to test whether the modified constructor (EventInfo)
      *             works correctly.
      * @tc.size    SmallTest
      * @tc.type    User
      */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_2200', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_2200 starts`);

    let itemCount = 1;
    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      triggerAction : triggerAction,
      itemCount : itemCount,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_2200 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_2300
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_2300
    * @tc.desc    The itemCount of EventInfo is 0, test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_2300', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_2300 starts`);

    let itemCount = 0;
    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      triggerAction : triggerAction,
      itemCount : itemCount,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_2300 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_2400
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_2400
    * @tc.desc    The itemCount of EventInfo is -1, test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_2400', 0, async function (done) {
      console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_2400 starts`);
  
      let itemCount = -1;
      let jsonObj = {
        type : eventType,
        bundleName : bundleName,
        triggerAction : triggerAction,
        itemCount : itemCount,
      }
  
      let event = new accessibility.EventInfo(jsonObj);

      accessibility.sendEvent(event).then((result) => {
        expect(result).assertEqual(undefined);
        done();
      }).catch(err => {
        console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_2400 has error: ${err}`);
        expect(null).assertFail();
        done();
      });
    })
  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_2500
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_2500
    * @tc.desc    The lastContent of EventInfo is '1', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_2500', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_2500 starts`);

    let lastContent = '1';
    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      triggerAction : triggerAction,
      lastContent : lastContent,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_2500 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_2600
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_2600
    * @tc.desc    The lastContent of EventInfo is '', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_2600', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_2600 starts`);

    let lastContent = '';
    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      triggerAction : triggerAction,
      lastContent : lastContent,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_2600 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_2700
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_2700
    * @tc.desc    The lastContent of EventInfo is null, test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_2700', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_2700 starts`);

    let lastContent = null;
    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      triggerAction : triggerAction,
      lastContent : lastContent,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_2700 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_2900
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_2900
    * @tc.desc    The parameter input is null, test the sendEvent() function
    *             The result of sendEvent() should be equal to a rejected promise of undefined
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_2900', 0, async function (done) {
        console.info('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_2900');
        let event = null;

        accessibility.sendEvent(event).then((result) => {           
            console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_2900 result ${result}`);
            expect(null).assertFail();            
            done();
        }).catch((err) => {
            console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_2900 has error: ${err}`);
            expect(true).assertTrue();
            done();
        });
    })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_3000
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_3000
    * @tc.desc    The pageId of EventInfo is 1, test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_3000', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_3000 starts`);

    let pageId = 1;
    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      pageId : pageId,
      triggerAction : triggerAction,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_3000 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_3100
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_3100
    * @tc.desc    The pageId of EventInfo is 0, test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_3100', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_3100 starts`);

    let pageId = 0;
    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      pageId : pageId,
      triggerAction : triggerAction,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_3100 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_3200
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_3200
    * @tc.desc    The pageId of EventInfo is -1, test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_3200', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_3200 starts`);

    let pageId = -1;
    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      pageId : pageId,
      triggerAction : triggerAction,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_3200 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })
  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_3300
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_3300
    * @tc.desc    The textMoveUnit of EventInfo is 'char', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_3300', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_3300 starts`);

    let textMoveUnit = 'char';
    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      triggerAction : triggerAction,
      textMoveUnit : textMoveUnit,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_3300 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_3400
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_3400
    * @tc.desc    The textMoveUnit of EventInfo is 'word', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_3400', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_3400 starts`);

    let textMoveUnit = 'word';
    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      triggerAction : triggerAction,
      textMoveUnit : textMoveUnit,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_3400 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_3500
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_3500
    * @tc.desc    The textMoveUnit of EventInfo is 'line', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_3500', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_3500 starts`);

    let textMoveUnit = 'line';
    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      triggerAction : triggerAction,
      textMoveUnit : textMoveUnit,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_3500 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_3600
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_3600
    * @tc.desc    The textMoveUnit of EventInfo is 'page', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_3600', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_3600 starts`);

    let textMoveUnit = 'page';
    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      triggerAction : triggerAction,
      textMoveUnit : textMoveUnit,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_3600 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_3700
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_3700
    * @tc.desc    The textMoveUnit of EventInfo is 'paragraph', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_3700', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_3700 starts`);

    let textMoveUnit = 'paragraph';
    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      triggerAction : triggerAction,
      textMoveUnit : textMoveUnit,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_3700 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_3800
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_3800
    * @tc.desc    The textMoveUnit of EventInfo is '', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_3800', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_3800 starts`);

    let textMoveUnit = '';
    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      triggerAction : triggerAction,
      textMoveUnit : textMoveUnit,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_3800 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_3900
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_3900
    * @tc.desc    The textMoveUnit of EventInfo is null, test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_3900', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_3900 starts`);

    let textMoveUnit = null;
    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      triggerAction : triggerAction,
      textMoveUnit : textMoveUnit,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_3900 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })
  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_4000
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_4000
    * @tc.desc    The triggerAction of EventInfo is 'accessibilityFocus', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_4000', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_4000 starts`);

    let triggerAction = 'accessibilityFocus';
    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      triggerAction : triggerAction,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_4000 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_4100
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_4100
    * @tc.desc    The triggerAction of EventInfo is 'clearAccessibilityFocus', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_4100', 0, async function (done) {
      console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_4100 starts`);
  
      let triggerAction = 'clearAccessibilityFocus';
      let jsonObj = {
        type : eventType,
        bundleName : bundleName,
        triggerAction : triggerAction,
      }
  
      let event = new accessibility.EventInfo(jsonObj);

      accessibility.sendEvent(event).then((result) => {
        expect(result).assertEqual(undefined);
        done();
      }).catch(err => {
        console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_4100 has error: ${err}`);
        expect(null).assertFail();
        done();
      });
    })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_4200
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_4200
    * @tc.desc    The triggerAction of EventInfo is 'focus', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_4200', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_4200 starts`);

    let triggerAction = 'focus';
    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      triggerAction : triggerAction,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_4200 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_4300
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_4300
    * @tc.desc    The triggerAction of EventInfo is 'clearFocus', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_4300', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_4300 starts`);

    let triggerAction = 'clearFocus';
    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      triggerAction : triggerAction,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_4300 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_4400
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_4400
    * @tc.desc    The triggerAction of EventInfo is 'clearSelection', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_4400', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_4400 starts`);

    let triggerAction = 'clearSelection';
    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      triggerAction : triggerAction,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_4400 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_4500
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_4500
    * @tc.desc    The triggerAction of EventInfo is 'click', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_4500', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_4500 starts`);

    let triggerAction = 'click';
    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      triggerAction : triggerAction,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_4500 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_4600
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_4600
    * @tc.desc    The triggerAction of EventInfo is 'longClick', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_4600', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_4600 starts`);

    let triggerAction = 'longClick';
    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      triggerAction : triggerAction,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_4600 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_4700
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_4700
    * @tc.desc    The triggerAction of EventInfo is 'cut', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_4700', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_4700 starts`);

    let triggerAction = 'cut';
    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      triggerAction : triggerAction,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_4700 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_4800
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_4800
    * @tc.desc    The triggerAction of EventInfo is 'copy', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_4800', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_4800 starts`);

    let triggerAction = 'copy';
    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      triggerAction : triggerAction,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_4800 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_4900
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_4900
    * @tc.desc    The triggerAction of EventInfo is 'paste', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_4900', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_4900 starts`);

    let triggerAction = 'paste';
    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      triggerAction : triggerAction,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_4900 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_5000
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_5000
    * @tc.desc    The triggerAction of EventInfo is 'select', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_5000', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_5000 starts`);

    let triggerAction = 'select';
    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      triggerAction : triggerAction,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_5000 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_5100
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_5100
    * @tc.desc    The triggerAction of EventInfo is 'setText', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_5100', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_5100 starts`);

    let triggerAction = 'setText';
    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      triggerAction : triggerAction,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_5100 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_5200
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_5200
    * @tc.desc    The triggerAction of EventInfo is 'delete', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_5200', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_5200 starts`);

    let triggerAction = 'delete';
    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      triggerAction : triggerAction,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_5200 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_5300
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_5300
    * @tc.desc    The triggerAction of EventInfo is 'scrollForward', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_5300', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_5300 starts`);

    let triggerAction = 'scrollForward';
    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      triggerAction : triggerAction,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_5300 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_5400
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_5400
    * @tc.desc    The triggerAction of EventInfo is 'scrollBackward', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_5400', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_5400 starts`);

    let triggerAction = 'scrollBackward';
    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      triggerAction : triggerAction,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_5400 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_5500
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_5500
    * @tc.desc    The triggerAction of EventInfo is 'setSelection', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_5500', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_5500 starts`);

    let triggerAction = 'setSelection';
    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      triggerAction : triggerAction,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_5500 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_5600
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_5600
    * @tc.desc    The triggerAction of EventInfo is '', test sendEvent() function
    *             The result of sendEvent() should be equal to a rejected promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_5600', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_5600 starts`);

    let triggerAction = '';
    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      triggerAction : triggerAction,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) =>{
        console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_5600 result ${result}`);
        expect(null).assertFail();
        done();
    }).catch((err) => {
        console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_5600 has error: ${err}`);
        expect(true).assertTrue();
        done();
    });
  })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_5700
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_5700
    * @tc.desc    The triggerAction of EventInfo is null, test sendEvent() function
    *             The result of sendEvent() should be equal to a rejected promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_5700', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_5700 starts`);

    let triggerAction = null;
    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      triggerAction : triggerAction,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) =>{
        console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_5700 result ${result}`);
        expect(null).assertFail();
        done();
    }).catch((err) => {
        console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_5700 has error: ${err}`);
        expect(true).assertTrue();
        done();
    });
  })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_5800
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_5800
    * @tc.desc    The type of EventInfo is 'accessibilityFocus', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_5800', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_5800 starts`);

    let eventType = 'accessibilityFocus';

    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      triggerAction : triggerAction,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_5800 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_5900
    * @tc.name    SendEvent_type_0020
    * @tc.desc    The type of EventInfo is 'accessibilityFocusClear', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_5900', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_5900 starts`);

    let eventType = 'accessibilityFocusClear';

    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      triggerAction : triggerAction,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_5900 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_6000
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_6000
    * @tc.desc    The type of EventInfo is 'click', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_6000', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_6000 starts`);

    let eventType = 'click';

    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      triggerAction : triggerAction,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_6000 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_6100
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_6100
    * @tc.desc    The type of EventInfo is 'longClick', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_6100', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_6100 starts`);

    let eventType = 'longClick';

    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      triggerAction : triggerAction,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_6100 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_6200
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_6200
    * @tc.desc    The type of EventInfo is 'select', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_6200', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_6200 starts`);

    let eventType = 'select';

    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      triggerAction : triggerAction,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_6200 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_6300
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_6300
    * @tc.desc    The type of EventInfo is 'hoverEnter', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_6300', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_6300 starts`);

    let eventType = 'hoverEnter';

    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      triggerAction : triggerAction,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_6300 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_6400
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_6400
    * @tc.desc    The type of EventInfo is 'hoverExit', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_6400', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_6400 starts`);

    let eventType = 'hoverExit';

    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      triggerAction : triggerAction,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_6400 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_6500
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_6500
    * @tc.desc    The type of EventInfo is 'textUpdate', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_6500', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_6500 starts`);

    let eventType = 'textUpdate';

    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      triggerAction : triggerAction,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_6500 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_6600
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_6600
    * @tc.desc    The type of EventInfo is 'textSelectionUpdate', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_6600', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_6600 starts`);

    let eventType = 'textSelectionUpdate';

    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      triggerAction : triggerAction,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_6600 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_6700
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_6700
    * @tc.desc    The type of EventInfo is 'scroll', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_6700', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_6700 starts`);

    let eventType = 'scroll';

    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      triggerAction : triggerAction,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_6700 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_6800
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_6800
    * @tc.desc    The type of EventInfo is '', test sendEvent() function
    *             The result of sendEvent() should be equal to a rejected promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_6800', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_6800 starts`);

    let eventType = '';

    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      triggerAction : triggerAction,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) =>{
        console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_6800 result ${result}`);
        expect(null).assertFail();
        done();
    }).catch((err) => {
        console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_6800 has error: ${err}`);
        expect(true).assertTrue();
        done();
    });
  })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_6900
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_6900
    * @tc.desc    The type of EventInfo is null, test sendEvent() function
    *             The result of sendEvent() should be equal to a rejected promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_6900', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_6900 starts`);

    let eventType = null;

    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      triggerAction : triggerAction,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) =>{
        console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_6900 result ${result}`);
        expect(null).assertFail();
        done();
    }).catch((err) => {
        console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_6900 has error: ${err}`);
        expect(true).assertTrue();
        done();
    });
  })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_7000
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_7000
    * @tc.desc    The windowUpdateType of EventInfo is '', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
   it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_7000', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_7000 starts`);

    let windowUpdateType = 'add';
    let jsonObj = {
      type : eventType,
      windowUpdateType : windowUpdateType,
      bundleName : bundleName,
      triggerAction : triggerAction,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_7000 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_7100
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_7100
    * @tc.desc    The windowUpdateType of EventInfo is '', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_7100', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_7100 starts`);

    let windowUpdateType = '';
    let jsonObj = {
      type : eventType,
      windowUpdateType : windowUpdateType,
      bundleName : bundleName,
      triggerAction : triggerAction,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_7100 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_7200
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_7200
    * @tc.desc    The windowUpdateType of EventInfo is null, test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_7200', 0, async function (done) {
    console.info(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_7200 starts`);

    let windowUpdateType = null;
    let jsonObj = {
      type : eventType,
      windowUpdateType : windowUpdateType,
      bundleName : bundleName,
      triggerAction : triggerAction,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) => {
      expect(result).assertEqual(undefined);
      done();
    }).catch(err => {
      console.error(`AccessibleSendEvent: SUB_BASIC_BARRIERFREE_API_AccessibleSendEvent_7200 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })
})
}
