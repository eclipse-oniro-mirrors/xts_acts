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
        setTimeout(done, 1000);
    })
    
    /******************************************************************************** */
    /* Cases SendEvent_0010-0020 & SendEvent_Null_0010-0020  & SendEvent_construct_0010*/
    /*    are for accessibility.sendEvent() API test                                  */
    /******************************************************************************** */

    /*
    * @tc.number  SendEvent_null_0020
    * @tc.name    SendEvent_null_0020
    * @tc.desc    The parameter input is null, test the sendEvent() function
    *             The result of sendEvent() should be equal to a rejected promise of undefined
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('SendEvent_null_0020', 0, async function (done) {
        console.info('SendEvent_null_0020');
        let event = null;

        accessibility.sendEvent(event).then((result) => {           
            console.error(`AccessibleSendEvent: SendEvent_null_0020 result ${result}`);
            expect(null).assertFail();            
            done();
        }).catch((err) => {
            console.info(`AccessibleSendEvent: SendEvent_null_0020 has error: ${err}`);
            expect(true).assertTrue();
            done();
        });
    })

    /*********************************************************************************************************** */
    /* Cases SendEvent_type_0010-SendEvent_itemCount_constructor_0030 
    /* are for interface accessibility.EventInfo API test                                                        */
    /*********************************************************************************************************** */

  /*
    * @tc.number  SendEvent_type_constructor_0010
    * @tc.name    SendEvent_type_0010
    * @tc.desc    The type of EventInfo is 'accessibilityFocus', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_type_constructor_0010', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_type_constructor_0010 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_type_constructor_0010 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SendEvent_type_constructor_0020
    * @tc.name    SendEvent_type_0020
    * @tc.desc    The type of EventInfo is 'accessibilityFocusClear', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_type_constructor_0020', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_type_constructor_0020 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_type_constructor_0020 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SendEvent_type_constructor_0030
    * @tc.name    SendEvent_type_constructor_0030
    * @tc.desc    The type of EventInfo is 'click', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_type_constructor_0030', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_type_constructor_0030 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_type_constructor_0030 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SendEvent_type_constructor_0040
    * @tc.name    SendEvent_type_constructor_0040
    * @tc.desc    The type of EventInfo is 'longClick', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_type_constructor_0040', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_type_constructor_0040 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_type_constructor_0040 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SendEvent_type_constructor_0060
    * @tc.name    SendEvent_type_constructor_0060
    * @tc.desc    The type of EventInfo is 'select', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_type_constructor_0060', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_type_constructor_0060 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_type_constructor_0060 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SendEvent_type_constructor_0070
    * @tc.name    SendEvent_type_constructor_0070
    * @tc.desc    The type of EventInfo is 'hoverEnter', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_type_constructor_0070', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_type_constructor_0070 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_type_constructor_0070 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SendEvent_type_constructor_0080
    * @tc.name    SendEvent_type_constructor_0080
    * @tc.desc    The type of EventInfo is 'hoverExit', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_type_constructor_0080', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_type_constructor_0080 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_type_constructor_0080 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SendEvent_type_constructor_0090
    * @tc.name    SendEvent_type_constructor_0090
    * @tc.desc    The type of EventInfo is 'textUpdate', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_type_constructor_0090', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_type_constructor_0090 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_type_constructor_0090 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SendEvent_type_constructor_0100
    * @tc.name    SendEvent_type_constructor_0100
    * @tc.desc    The type of EventInfo is 'textSelectionUpdate', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_type_constructor_0100', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_type_constructor_0100 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_type_constructor_0100 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SendEvent_type_constructor_0110
    * @tc.name    SendEvent_type_constructor_0110
    * @tc.desc    The type of EventInfo is 'scroll', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_type_constructor_0110', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_type_constructor_0110 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_type_constructor_0110 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SendEvent_type_constructor_0120
    * @tc.name    SendEvent_type_constructor_0120
    * @tc.desc    The type of EventInfo is '', test sendEvent() function
    *             The result of sendEvent() should be equal to a rejected promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_type_constructor_0120', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_type_constructor_0120 starts`);

    let eventType = '';

    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      triggerAction : triggerAction,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) =>{
        console.error(`AccessibleSendEvent: SendEvent_type_constructor_0120 result ${result}`);
        expect(null).assertFail();
        done();
    }).catch((err) => {
        console.info(`AccessibleSendEvent: SendEvent_type_constructor_0120 has error: ${err}`);
        expect(true).assertTrue();
        done();
    });
  })

  /*
    * @tc.number  SendEvent_type_constructor_0130
    * @tc.name    SendEvent_type_constructor_0130
    * @tc.desc    The type of EventInfo is null, test sendEvent() function
    *             The result of sendEvent() should be equal to a rejected promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_type_constructor_0130', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_type_constructor_0130 starts`);

    let eventType = null;

    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      triggerAction : triggerAction,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) =>{
        console.error(`AccessibleSendEvent: SendEvent_type_constructor_0130 result ${result}`);
        expect(null).assertFail();
        done();
    }).catch((err) => {
        console.info(`AccessibleSendEvent: SendEvent_type_constructor_0130 has error: ${err}`);
        expect(true).assertTrue();
        done();
    });
  })

  /*
    * @tc.number  SendEvent_windowUpdateType_constructor_0050
    * @tc.name    SendEvent_windowUpdateType_constructor_0050
    * @tc.desc    The windowUpdateType of EventInfo is '', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
   it('SendEvent_windowUpdateType_constructor_0050', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_windowUpdateType_constructor_0050 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_windowUpdateType_constructor_0050 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SendEvent_windowUpdateType_constructor_0060
    * @tc.name    SendEvent_windowUpdateType_constructor_0060
    * @tc.desc    The windowUpdateType of EventInfo is '', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_windowUpdateType_constructor_0060', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_windowUpdateType_constructor_0060 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_windowUpdateType_constructor_0060 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SendEvent_windowUpdateType_constructor_0070
    * @tc.name    SendEvent_windowUpdateType_constructor_0070
    * @tc.desc    The windowUpdateType of EventInfo is null, test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_windowUpdateType_constructor_0070', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_windowUpdateType_constructor_0070 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_windowUpdateType_constructor_0070 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SendEvent_bundleName_constructor_0010
    * @tc.name    SendEvent_bundleName_constructor_0010
    * @tc.desc    The bundleName of EventInfo is 'com.ixaa.testfora11y', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_bundleName_constructor_0010', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_bundleName_constructor_0010 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_bundleName_constructor_0010 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SendEvent_bundleName_constructor_0020
    * @tc.name    SendEvent_bundleName_constructor_0020
    * @tc.desc    The bundleName of EventInfo is '', test sendEvent() function
    *             The result of sendEvent() should be equal to a rejected promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_bundleName_constructor_0020', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_bundleName_constructor_0020 starts`);

    let localBundleName = '';
    let jsonObj = {
      type : eventType,
      bundleName : localBundleName,
      triggerAction : triggerAction,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) =>{
        console.error(`AccessibleSendEvent: SendEvent_bundleName_constructor_0020 result ${result}`);
        expect(null).assertFail();
        done();
    }).catch((err) => {
        console.info(`AccessibleSendEvent: SendEvent_bundleName_constructor_0020 has error: ${err}`);
        expect(true).assertTrue();
        done();
    });
  })

  /*
    * @tc.number  SendEvent_bundleName_constructor_0030
    * @tc.name    SendEvent_bundleName_constructor_0030
    * @tc.desc    The bundleName of EventInfo is null, test sendEvent() function
    *             The result of sendEvent() should be equal to a rejected promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_bundleName_constructor_0030', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_bundleName_constructor_0030 starts`);

    let localBundleName = null;
    let jsonObj = {
      type : eventType,
      bundleName : localBundleName,
      triggerAction : triggerAction,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) =>{
        console.error(`AccessibleSendEvent: SendEvent_bundleName_constructor_0030 result ${result}`);
        expect(null).assertFail();
        done();
    }).catch((err) => {
        console.info(`AccessibleSendEvent: SendEvent_bundleName_constructor_0030 has error: ${err}`);
        expect(true).assertTrue();
        done();
    });
  })

  /*
    * @tc.number  SendEvent_componentType_constructor_0010
    * @tc.name    SendEvent_componentType_constructor_0010
    * @tc.desc    The componentType of EventInfo is 'button', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_componentType_constructor_0010', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_componentType_constructor_0010 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_componentType_constructor_0010 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SendEvent_componentType_constructor_0020
    * @tc.name    SendEvent_componentType_constructor_0020
    * @tc.desc    The componentType of EventInfo is '', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_componentType_constructor_0020', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_componentType_constructor_0020 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_componentType_constructor_0020 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SendEvent_componentType_constructor_0030
    * @tc.name    SendEvent_componentType_constructor_0030
    * @tc.desc    The componentType of EventInfo is null, test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_componentType_constructor_0030', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_componentType_constructor_0030 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_componentType_constructor_0030 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SendEvent_pageId_constructor_0010
    * @tc.name    SendEvent_pageId_constructor_0010
    * @tc.desc    The pageId of EventInfo is 1, test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_pageId_constructor_0010', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_pageId_constructor_0010 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_pageId_constructor_0010 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SendEvent_pageId_constructor_0020
    * @tc.name    SendEvent_pageId_constructor_0020
    * @tc.desc    The pageId of EventInfo is 0, test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_pageId_constructor_0020', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_pageId_constructor_0020 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_pageId_constructor_0020 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SendEvent_pageId_constructor_0030
    * @tc.name    SendEvent_pageId_constructor_0030
    * @tc.desc    The pageId of EventInfo is -1, test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_pageId_constructor_0030', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_pageId_constructor_0030 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_pageId_constructor_0030 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SendEvent_description_constructor_0010
    * @tc.name    SendEvent_description_constructor_0010
    * @tc.desc    The description of EventInfo is '1', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_description_constructor_0010', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_description_constructor_0010 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_description_constructor_0010 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SendEvent_description_constructor_0020
    * @tc.name    SendEvent_description_constructor_0020
    * @tc.desc    The description of EventInfo is '', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_description_constructor_0020', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_description_constructor_0020 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_description_constructor_0020 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SendEvent_description_constructor_0030
    * @tc.name    SendEvent_description_constructor_0030
    * @tc.desc    The description of EventInfo is null, test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_description_constructor_0030', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_description_constructor_0030 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_description_constructor_0030 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SendEvent_triggerAction_constructor_0010
    * @tc.name    SendEvent_triggerAction_constructor_0010
    * @tc.desc    The triggerAction of EventInfo is 'accessibilityFocus', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_triggerAction_constructor_0010', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_triggerAction_constructor_0010 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_triggerAction_constructor_0010 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

    /*
    * @tc.number  SendEvent_triggerAction_constructor_0020
    * @tc.name    SendEvent_triggerAction_constructor_0020
    * @tc.desc    The triggerAction of EventInfo is 'clearAccessibilityFocus', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('SendEvent_triggerAction_constructor_0020', 0, async function (done) {
      console.info(`AccessibleSendEvent: SendEvent_triggerAction_constructor_0020 starts`);
  
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
        console.error(`AccessibleSendEvent: SendEvent_triggerAction_constructor_0020 has error: ${err}`);
        expect(null).assertFail();
        done();
      });
    })

  /*
    * @tc.number  SendEvent_triggerAction_constructor_0030
    * @tc.name    SendEvent_triggerAction_constructor_0030
    * @tc.desc    The triggerAction of EventInfo is 'focus', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_triggerAction_constructor_0030', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_triggerAction_constructor_0030 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_triggerAction_constructor_0030 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SendEvent_triggerAction_constructor_0040
    * @tc.name    SendEvent_triggerAction_constructor_0040
    * @tc.desc    The triggerAction of EventInfo is 'clearFocus', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_triggerAction_constructor_0040', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_triggerAction_constructor_0040 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_triggerAction_constructor_0040 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SendEvent_triggerAction_constructor_0050
    * @tc.name    SendEvent_triggerAction_constructor_0050
    * @tc.desc    The triggerAction of EventInfo is 'clearSelection', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_triggerAction_constructor_0050', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_triggerAction_constructor_0050 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_triggerAction_constructor_0050 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SendEvent_triggerAction_constructor_0060
    * @tc.name    SendEvent_triggerAction_constructor_0060
    * @tc.desc    The triggerAction of EventInfo is 'click', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_triggerAction_constructor_0060', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_triggerAction_constructor_0060 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_triggerAction_constructor_0060 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SendEvent_triggerAction_constructor_0070
    * @tc.name    SendEvent_triggerAction_constructor_0070
    * @tc.desc    The triggerAction of EventInfo is 'longClick', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_triggerAction_constructor_0070', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_triggerAction_constructor_0070 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_triggerAction_constructor_0070 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SendEvent_triggerAction_constructor_0080
    * @tc.name    SendEvent_triggerAction_constructor_0080
    * @tc.desc    The triggerAction of EventInfo is 'cut', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_triggerAction_constructor_0080', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_triggerAction_constructor_0080 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_triggerAction_constructor_0080 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SendEvent_triggerAction_constructor_0090
    * @tc.name    SendEvent_triggerAction_constructor_0090
    * @tc.desc    The triggerAction of EventInfo is 'copy', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_triggerAction_constructor_0090', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_triggerAction_constructor_0090 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_triggerAction_constructor_0090 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SendEvent_triggerAction_constructor_0100
    * @tc.name    SendEvent_triggerAction_constructor_0100
    * @tc.desc    The triggerAction of EventInfo is 'paste', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_triggerAction_constructor_0100', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_triggerAction_constructor_0100 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_triggerAction_constructor_0100 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SendEvent_triggerAction_constructor_0110
    * @tc.name    SendEvent_triggerAction_constructor_0110
    * @tc.desc    The triggerAction of EventInfo is 'select', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_triggerAction_constructor_0110', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_triggerAction_constructor_0110 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_triggerAction_constructor_0110 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SendEvent_triggerAction_constructor_0120
    * @tc.name    SendEvent_triggerAction_constructor_0120
    * @tc.desc    The triggerAction of EventInfo is 'setText', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_triggerAction_constructor_0120', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_triggerAction_constructor_0120 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_triggerAction_constructor_0120 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SendEvent_triggerAction_constructor_0130
    * @tc.name    SendEvent_triggerAction_constructor_0130
    * @tc.desc    The triggerAction of EventInfo is 'delete', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_triggerAction_constructor_0130', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_triggerAction_constructor_0130 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_triggerAction_constructor_0130 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SendEvent_triggerAction_constructor_0140
    * @tc.name    SendEvent_triggerAction_constructor_0140
    * @tc.desc    The triggerAction of EventInfo is 'scrollForward', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_triggerAction_constructor_0140', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_triggerAction_constructor_0140 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_triggerAction_constructor_0140 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SendEvent_triggerAction_constructor_0150
    * @tc.name    SendEvent_triggerAction_constructor_0150
    * @tc.desc    The triggerAction of EventInfo is 'scrollBackward', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_triggerAction_constructor_0150', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_triggerAction_constructor_0150 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_triggerAction_constructor_0150 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SendEvent_triggerAction_constructor_0160
    * @tc.name    SendEvent_triggerAction_constructor_0160
    * @tc.desc    The triggerAction of EventInfo is 'setSelection', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_triggerAction_constructor_0160', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_triggerAction_constructor_0160 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_triggerAction_constructor_0160 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SendEvent_triggerAction_constructor_0170
    * @tc.name    SendEvent_triggerAction_constructor_0170
    * @tc.desc    The triggerAction of EventInfo is '', test sendEvent() function
    *             The result of sendEvent() should be equal to a rejected promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_triggerAction_constructor_0170', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_triggerAction_constructor_0170 starts`);

    let triggerAction = '';
    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      triggerAction : triggerAction,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) =>{
        console.error(`AccessibleSendEvent: SendEvent_triggerAction_constructor_0170 result ${result}`);
        expect(null).assertFail();
        done();
    }).catch((err) => {
        console.info(`AccessibleSendEvent: SendEvent_triggerAction_constructor_0170 has error: ${err}`);
        expect(true).assertTrue();
        done();
    });
  })

  /*
    * @tc.number  SendEvent_triggerAction_constructor_0180
    * @tc.name    SendEvent_triggerAction_constructor_0180
    * @tc.desc    The triggerAction of EventInfo is null, test sendEvent() function
    *             The result of sendEvent() should be equal to a rejected promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_triggerAction_constructor_0180', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_triggerAction_constructor_0180 starts`);

    let triggerAction = null;
    let jsonObj = {
      type : eventType,
      bundleName : bundleName,
      triggerAction : triggerAction,
    }

    let event = new accessibility.EventInfo(jsonObj);

    accessibility.sendEvent(event).then((result) =>{
        console.error(`AccessibleSendEvent: SendEvent_triggerAction_constructor_0180 result ${result}`);
        expect(null).assertFail();
        done();
    }).catch((err) => {
        console.info(`AccessibleSendEvent: SendEvent_triggerAction_constructor_0180 has error: ${err}`);
        expect(true).assertTrue();
        done();
    });
  })

  /*
    * @tc.number  SendEvent_textMoveUnit_constructor_0010
    * @tc.name    SendEvent_textMoveUnit_constructor_0010
    * @tc.desc    The textMoveUnit of EventInfo is 'char', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_textMoveUnit_constructor_0010', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_textMoveUnit_constructor_0010 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_textMoveUnit_constructor_0010 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SendEvent_textMoveUnit_constructor_0020
    * @tc.name    SendEvent_textMoveUnit_constructor_0020
    * @tc.desc    The textMoveUnit of EventInfo is 'word', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_textMoveUnit_constructor_0020', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_textMoveUnit_constructor_0020 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_textMoveUnit_constructor_0020 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SendEvent_textMoveUnit_constructor_0030
    * @tc.name    SendEvent_textMoveUnit_constructor_0030
    * @tc.desc    The textMoveUnit of EventInfo is 'line', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_textMoveUnit_constructor_0030', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_textMoveUnit_constructor_0030 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_textMoveUnit_constructor_0030 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SendEvent_textMoveUnit_constructor_0040
    * @tc.name    SendEvent_textMoveUnit_constructor_0040
    * @tc.desc    The textMoveUnit of EventInfo is 'page', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_textMoveUnit_constructor_0040', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_textMoveUnit_constructor_0040 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_textMoveUnit_constructor_0040 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SendEvent_textMoveUnit_constructor_0050
    * @tc.name    SendEvent_textMoveUnit_constructor_0050
    * @tc.desc    The textMoveUnit of EventInfo is 'paragraph', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_textMoveUnit_constructor_0050', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_textMoveUnit_constructor_0050 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_textMoveUnit_constructor_0050 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SendEvent_textMoveUnit_constructor_0060
    * @tc.name    SendEvent_textMoveUnit_constructor_0060
    * @tc.desc    The textMoveUnit of EventInfo is '', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_textMoveUnit_constructor_0060', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_textMoveUnit_constructor_0060 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_textMoveUnit_constructor_0060 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SendEvent_textMoveUnit_constructor_0070
    * @tc.name    SendEvent_textMoveUnit_constructor_0070
    * @tc.desc    The textMoveUnit of EventInfo is null, test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_textMoveUnit_constructor_0070', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_textMoveUnit_constructor_0070 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_textMoveUnit_constructor_0070 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SendEvent_contents_constructor_0010
    * @tc.name    SendEvent_contents_constructor_0010
    * @tc.desc    The contents of EventInfo is ['1'], test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_contents_constructor_0010', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_contents_constructor_0010 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_contents_constructor_0010 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SendEvent_contents_constructor_0020
    * @tc.name    SendEvent_contents_constructor_0020
    * @tc.desc    The contents of EventInfo is [], test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_contents_constructor_0020', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_contents_constructor_0020 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_contents_constructor_0020 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SendEvent_lastContent_constructor_0010
    * @tc.name    SendEvent_lastContent_constructor_0010
    * @tc.desc    The lastContent of EventInfo is '1', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_lastContent_constructor_0010', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_lastContent_constructor_0010 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_lastContent_constructor_0010 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SendEvent_lastContent_constructor_0020
    * @tc.name    SendEvent_lastContent_constructor_0020
    * @tc.desc    The lastContent of EventInfo is '', test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_lastContent_constructor_0020', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_lastContent_constructor_0020 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_lastContent_constructor_0020 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SendEvent_lastContent_constructor_0030
    * @tc.name    SendEvent_lastContent_constructor_0030
    * @tc.desc    The lastContent of EventInfo is null, test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_lastContent_constructor_0030', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_lastContent_constructor_0030 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_lastContent_constructor_0030 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SendEvent_beginIndex_constructor_0010
    * @tc.name    SendEvent_beginIndex_constructor_0010
    * @tc.desc    The beginIndex of EventInfo is 1, test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_beginIndex_constructor_0010', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_beginIndex_constructor_0010 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_beginIndex_constructor_0010 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SendEvent_beginIndex_constructor_0020
    * @tc.name    SendEvent_beginIndex_constructor_0020
    * @tc.desc    The beginIndex of EventInfo is 0, test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_beginIndex_constructor_0020', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_beginIndex_constructor_0020 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_beginIndex_constructor_0020 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SendEvent_beginIndex_constructor_0030
    * @tc.name    SendEvent_beginIndex_constructor_0030
    * @tc.desc    The beginIndex of EventInfo is -1, test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_beginIndex_constructor_0030', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_beginIndex_constructor_0030 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_beginIndex_constructor_0030 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
      * @tc.number  SendEvent_currentIndex_constructor_0010
      * @tc.name    SendEvent_currentIndex_constructor_0010
      * @tc.desc    The currentIndex of EventInfo is 1, test sendEvent() function
      *             The result of sendEvent() should be equal to a promise of undefined
      *             Another test point is to test whether the modified constructor (EventInfo)
      *             works correctly.
      * @tc.size    SmallTest
      * @tc.type    User
      */
  it('SendEvent_currentIndex_constructor_0010', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_currentIndex_constructor_0010 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_currentIndex_constructor_0010 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SendEvent_currentIndex_constructor_0020
    * @tc.name    SendEvent_currentIndex_constructor_0020
    * @tc.desc    The currentIndex of EventInfo is 0, test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_currentIndex_constructor_0020', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_currentIndex_constructor_0020 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_currentIndex_constructor_0020 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SendEvent_currentIndex_constructor_0030
    * @tc.name    SendEvent_currentIndex_constructor_0030
    * @tc.desc    The currentIndex of EventInfo is -1, test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_currentIndex_constructor_0030', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_currentIndex_constructor_0030 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_currentIndex_constructor_0030 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
      * @tc.number  SendEvent_endIndex_constructor_0010
      * @tc.name    SendEvent_endIndex_constructor_0010
      * @tc.desc    The endIndex of EventInfo is 1, test sendEvent() function
      *             The result of sendEvent() should be equal to a promise of undefined
      *             Another test point is to test whether the modified constructor (EventInfo)
      *             works correctly.
      * @tc.size    SmallTest
      * @tc.type    User
      */
  it('SendEvent_endIndex_constructor_0010', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_endIndex_constructor_0010 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_endIndex_constructor_0010 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SendEvent_endIndex_constructor_0020
    * @tc.name    SendEvent_endIndex_constructor_0020
    * @tc.desc    The endIndex of EventInfo is 0, test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_endIndex_constructor_0020', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_endIndex_constructor_0020 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_endIndex_constructor_0020 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SendEvent_endIndex_constructor_0030
    * @tc.name    SendEvent_endIndex_constructor_0030
    * @tc.desc    The endIndex of EventInfo is -1, test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_endIndex_constructor_0030', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_endIndex_constructor_0030 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_endIndex_constructor_0030 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
      * @tc.number  SendEvent_itemCount_constructor_0010
      * @tc.name    SendEvent_itemCount_constructor_0010
      * @tc.desc    The itemCount of EventInfo is 1, test sendEvent() function
      *             The result of sendEvent() should be equal to a promise of undefined
      *             Another test point is to test whether the modified constructor (EventInfo)
      *             works correctly.
      * @tc.size    SmallTest
      * @tc.type    User
      */
  it('SendEvent_itemCount_constructor_0010', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_itemCount_constructor_0010 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_itemCount_constructor_0010 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

  /*
    * @tc.number  SendEvent_itemCount_constructor_0020
    * @tc.name    SendEvent_itemCount_constructor_0020
    * @tc.desc    The itemCount of EventInfo is 0, test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
  it('SendEvent_itemCount_constructor_0020', 0, async function (done) {
    console.info(`AccessibleSendEvent: SendEvent_itemCount_constructor_0020 starts`);

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
      console.error(`AccessibleSendEvent: SendEvent_itemCount_constructor_0020 has error: ${err}`);
      expect(null).assertFail();
      done();
    });
  })

    /*
    * @tc.number  SendEvent_itemCount_constructor_0030
    * @tc.name    SendEvent_itemCount_constructor_0030
    * @tc.desc    The itemCount of EventInfo is -1, test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    *             Another test point is to test whether the modified constructor (EventInfo)
    *             works correctly.
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('SendEvent_itemCount_constructor_0030', 0, async function (done) {
      console.info(`AccessibleSendEvent: SendEvent_itemCount_constructor_0030 starts`);
  
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
        console.error(`AccessibleSendEvent: SendEvent_itemCount_constructor_0030 has error: ${err}`);
        expect(null).assertFail();
        done();
      });
    })
})
}
