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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
import accessibility from '@ohos.accessibility';
import GesturePath from '@ohos.accessibility.GesturePath';
import GesturePoint from '@ohos.accessibility.GesturePoint';
import AccessibilityExtensionAbility from '@ohos.application.AccessibilityExtensionAbility';

const bundleName = 'com.sample.testfora11y';
const triggerAction = 'accessibilityFocus';
const eventType = 'accessibilityFocus';

export default function abilityTest() {
  describe('AccessibilityErrCode', function () {
    let axContext = null;
    let object = null;
    beforeEach(async function (done) {
      console.info(`AccessibilityErrCode: beforeEach starts`);
      done();
    })

    afterEach(async function (done) {
      console.info(`AccessibilityErrCode: afterEach starts`);
      setTimeout(done, 1000);
    })

    /* Cases for namespace accessibility */
    /*
    * @tc.number  AbilityExtensionList_0100
    * @tc.name    AbilityExtensionList_0100
    * @tc.desc    The parameters input are 'audible' and 'install', test the getAccessibilityExtensionList()
    *             function, and the output is the list of AccessibilityAbilityInfo
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('AbilityExtensionList_0100', 0, async function (done) {
      console.info('AbilityExtensionList_0100');
      accessibility.getAccessibilityExtensionList('audible', 'install', (err, data) => {
        if (err && err.code != 0) {
          console.error(`AccessibilityErrCodeTest: AbilityExtensionList_0100 has error: ${err.code}`);
          expect(null).assertFail();
          done();
        }
        console.info(`AccessibilityErrCodeTest: AbilityExtensionList_0100 result ${data.length}`);
        expect(Array.isArray(data)).assertEqual(true);
        done();
      });
    })

    /*
    * @tc.number  AbilityExtensionList_0200
    * @tc.name    AbilityExtensionList_0200
    * @tc.desc    The parameters input are 'audible' and 'install', test the getAccessibilityExtensionList() function,
    *             and the output is the list of AccessibilityAbilityInfo
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('AbilityExtensionList_0200', 0, async function (done) {
      console.info('AbilityExtensionList_0200');
      accessibility.getAccessibilityExtensionList('audible', 'install').then((result) => {
        console.info(`AccessibilityErrCodeTest: AbilityExtensionList_0200 result ${result.length}`);
        expect(Array.isArray(result)).assertEqual(true);
        done();
      }).catch((err) => {
        console.error(`AccessibilityErrCodeTest: AbilityExtensionList_0200 has error: ${err}`);
        expect(null).assertFail();
        done();
      });
    })

    /*
    * @tc.number  AbilityExtensionList_0300
    * @tc.name    AbilityExtensionList_0300
    * @tc.desc    The parameters input are 'generic' and 'install', test the getAccessibilityExtensionList()
    *             function, and the output is the list of AccessibilityAbilityInfo
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('AbilityExtensionList_0300', 0, async function (done) {
      console.info('AbilityExtensionList_0300');
      accessibility.getAccessibilityExtensionList('generic', 'install', (err, data) => {
        if (err && err.code != 0) {
          console.error(`AccessibilityErrCodeTest: AbilityExtensionList_0300 has error: ${err.code}`);
          expect(null).assertFail();
          done();
        }
        console.info(`AccessibilityErrCodeTest: AbilityExtensionList_0300 result ${data.length}`);
        expect(Array.isArray(data)).assertEqual(true);
        done();
      });
    })

    /*
    * @tc.number  AbilityExtensionList_0400
    * @tc.name    AbilityExtensionList_0400
    * @tc.desc    The parameters input are 'generic' and 'install', test the getAccessibilityExtensionList() function,
    *             and the output is the list of AccessibilityAbilityInfo
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('AbilityExtensionList_0400', 0, async function (done) {
      console.info('AbilityExtensionList_0400');
      accessibility.getAccessibilityExtensionList('generic', 'install').then((result) => {
        console.info(`AccessibilityErrCodeTest: AbilityExtensionList_0400 result ${result.length}`);
        expect(Array.isArray(result)).assertEqual(true);
        done();
      }).catch((err) => {
        console.error(`AccessibilityErrCodeTest: AbilityExtensionList_0400 has error: ${err}`);
        expect(null).assertFail();
        done();
      });
    })

    /*
    * @tc.number  AbilityExtensionList_0500
    * @tc.name    AbilityExtensionList_0500
    * @tc.desc    The parameters input are 'generic' and 'install', test the getAccessibilityExtensionList()
    *             function, and the output is the list of AccessibilityAbilityInfo
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('AbilityExtensionList_0500', 0, async function (done) {
      console.info('AbilityExtensionList_0500');
      accessibility.getAccessibilityExtensionList('generic', 'install', (err, data) => {
        if (err && err.code != 0) {
          console.error(`AccessibilityErrCodeTest: AbilityExtensionList_0500 has error: ${err.code}`);
          expect(null).assertFail();
          done();
        }
        console.info(`AccessibilityErrCodeTest: AbilityExtensionList_0500 result ${data.length}`);
        expect(Array.isArray(data)).assertEqual(true);
        done();
      });
    })

    /*
    * @tc.number  AbilityExtensionList_0600
    * @tc.name    AbilityExtensionList_0600
    * @tc.desc    The parameters input are 'generic' and 'install', test the getAccessibilityExtensionList() function,
    *             and the output is the list of AccessibilityAbilityInfo
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('AbilityExtensionList_0600', 0, async function (done) {
      console.info('AbilityExtensionList_0600');
      accessibility.getAccessibilityExtensionList('generic', 'install').then((result) => {
        console.info(`AccessibilityErrCodeTest: AbilityExtensionList_0600 result ${result.length}`);
        expect(Array.isArray(result)).assertEqual(true);
        done();
      }).catch((err) => {
        console.error(`AccessibilityErrCodeTest: AbilityExtensionList_0600 has error: ${err}`);
        expect(null).assertFail();
        done();
      });
    })

    /*
    * @tc.number  AbilityExtensionList_0700
    * @tc.name    AbilityExtensionList_0700
    * @tc.desc    The parameters input are 'haptic' and 'install', test the getAccessibilityExtensionList()
    *             function, and the output is the list of AccessibilityAbilityInfo
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('AbilityExtensionList_0700', 0, async function (done) {
      console.info('AbilityExtensionList_0700');
      accessibility.getAccessibilityExtensionList('haptic', 'install', (err, data) => {
        if (err && err.code != 0) {
          console.error(`AccessibilityErrCodeTest: AbilityExtensionList_0700 has error: ${err.code}`);
          expect(null).assertFail();
          done();
        }
        console.info(`AccessibilityErrCodeTest: AbilityExtensionList_0700 result ${data.length}`);
        expect(Array.isArray(data)).assertEqual(true);
        done();
      });
    })

    /*
    * @tc.number  AbilityExtensionList_0800
    * @tc.name    AbilityExtensionList_0800
    * @tc.desc    The parameters input are 'haptic' and 'install', test the getAccessibilityExtensionList() function,
    *             and the output is the list of AccessibilityAbilityInfo
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('AbilityExtensionList_0800', 0, async function (done) {
      console.info('AbilityExtensionList_0800');
      accessibility.getAccessibilityExtensionList('haptic', 'install').then((result) => {
        console.info(`AccessibilityErrCodeTest: AbilityExtensionList_0800 result ${result.length}`);
        expect(Array.isArray(result)).assertEqual(true);
        done();
      }).catch((err) => {
        console.error(`AccessibilityErrCodeTest: AbilityExtensionList_0800 has error: ${err}`);
        expect(null).assertFail();
        done();
      });
    })

    /*
    * @tc.number  AbilityExtensionList_0900
    * @tc.name    AbilityExtensionList_0900
    * @tc.desc    The parameters input are 'spoken' and 'install', test the getAccessibilityExtensionList()
    *             function, and the output is the list of AccessibilityAbilityInfo
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('AbilityExtensionList_0900', 0, async function (done) {
      console.info('AbilityExtensionList_0900');
      accessibility.getAccessibilityExtensionList('spoken', 'install', (err, data) => {
        if (err && err.code != 0) {
          console.error(`AccessibilityErrCodeTest: AbilityExtensionList_0900 has error: ${err.code}`);
          expect(null).assertFail();
          done();
        }
        console.info(`AccessibilityErrCodeTest: AbilityExtensionList_0900 result ${data.length}`);
        expect(Array.isArray(data)).assertEqual(true);
        done();
      });
    })

    /*
    * @tc.number  AbilityExtensionList_1000
    * @tc.name    AbilityExtensionList_1000
    * @tc.desc    The parameters input are 'spoken' and 'install', test the getAccessibilityExtensionList() function,
    *             and the output is the list of AccessibilityAbilityInfo
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('AbilityExtensionList_1000', 0, async function (done) {
      console.info('AbilityExtensionList_1000');
      accessibility.getAccessibilityExtensionList('spoken', 'install').then((result) => {
        console.info(`AccessibilityErrCodeTest: AbilityExtensionList_1000 result ${result.length}`);
        expect(Array.isArray(result)).assertEqual(true);
        done();
      }).catch((err) => {
        console.error(`AccessibilityErrCodeTest: AbilityExtensionList_1000 has error: ${err}`);
        expect(null).assertFail();
        done();
      });
    })

    /*
    * @tc.number  AbilityExtensionList_1100
    * @tc.name    AbilityExtensionList_1100
    * @tc.desc    The parameters input are 'visual' and 'install', test the getAccessibilityExtensionList()
    *             function, and the output is the list of AccessibilityAbilityInfo
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('AbilityExtensionList_1100', 0, async function (done) {
      console.info('AbilityExtensionList_1100');
      accessibility.getAccessibilityExtensionList('visual', 'install', (err, data) => {
        if (err && err.code != 0) {
          console.error(`AccessibilityErrCodeTest: AbilityExtensionList_1100 has error: ${err.code}`);
          expect(null).assertFail();
          done();
        }
        console.info(`AccessibilityErrCodeTest: AbilityExtensionList_1100 result ${data.length}`);
        expect(Array.isArray(data)).assertEqual(true);
        done();
      });
    })

    /*
    * @tc.number  AbilityExtensionList_1200
    * @tc.name    AbilityExtensionList_1200
    * @tc.desc    The parameters input are 'visual' and 'install', test the getAccessibilityExtensionList() function,
    *             and the output is the list of AccessibilityAbilityInfo
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('AbilityExtensionList_1200', 0, async function (done) {
      console.info('AbilityExtensionList_1200');
      accessibility.getAccessibilityExtensionList('visual', 'install').then((result) => {
        console.info(`AccessibilityErrCodeTest: AbilityExtensionList_1200 result ${result.length}`);
        expect(Array.isArray(result)).assertEqual(true);
        done();
      }).catch((err) => {
        console.error(`AccessibilityErrCodeTest: AbilityExtensionList_1200 has error: ${err}`);
        expect(null).assertFail();
        done();
      });
    })

    /*
    * @tc.number  AbilityExtensionList_1300
    * @tc.name    AbilityExtensionList_1300
    * @tc.desc    The parameters input are 'all' and 'enable', test the getAccessibilityExtensionList()
    *             function, and the output is the list of AccessibilityAbilityInfo
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('AbilityExtensionList_1300', 0, async function (done) {
      console.info('AbilityExtensionList_1300');
      accessibility.getAccessibilityExtensionList('all', 'enable', (err, data) => {
        if (err && err.code != 0) {
          console.error(`AccessibilityErrCodeTest: AbilityExtensionList_1300 has error: ${err.code}`);
          expect(null).assertFail();
          done();
        }
        console.info(`AccessibilityErrCodeTest: AbilityExtensionList_1300 result ${data.length}`);
        expect(Array.isArray(data)).assertEqual(true);
        done();
      });
    })

    /*
    * @tc.number  AbilityExtensionList_1400
    * @tc.name    AbilityExtensionList_1400
    * @tc.desc    The parameters input are 'all' and 'enable', test the getAccessibilityExtensionList() function,
    *             and the output is the list of AccessibilityAbilityInfo
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('AbilityExtensionList_1400', 0, async function (done) {
      console.info('AbilityExtensionList_1400');
      accessibility.getAccessibilityExtensionList('all', 'enable').then((result) => {
        console.info(`AccessibilityErrCodeTest: AbilityExtensionList_1400 result ${result.length}`);
        expect(Array.isArray(result)).assertEqual(true);
        done();
      }).catch((err) => {
        console.error(`AccessibilityErrCodeTest: AbilityExtensionList_1400 has error: ${err}`);
        expect(null).assertFail();
        done();
      });
    })

    /*
    * @tc.number  AbilityExtensionList_1500
    * @tc.name    AbilityExtensionList_1500
    * @tc.desc    The parameters input are 'all' and 'disable', test the getAccessibilityExtensionList()
    *             function, and the output is the list of AccessibilityAbilityInfo
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('AbilityExtensionList_1500', 0, async function (done) {
      console.info('AbilityExtensionList_1500');
      accessibility.getAccessibilityExtensionList('all', 'disable', (err, data) => {
        if (err && err.code != 0) {
          console.error(`AccessibilityErrCodeTest: AbilityExtensionList_1500 has error: ${err.code}`);
          expect(null).assertFail();
          done();
        }
        console.info(`AccessibilityErrCodeTest: AbilityExtensionList_1500 result ${data.length}`);
        expect(Array.isArray(data)).assertEqual(true);
        done();
      });
    })

    /*
    * @tc.number  AbilityExtensionList_1600
    * @tc.name    AbilityExtensionList_1600
    * @tc.desc    The parameters input are 'all' and 'disable', test the getAccessibilityExtensionList() function,
    *             and the output is the list of AccessibilityAbilityInfo
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('AbilityExtensionList_1600', 0, async function (done) {
      console.info('AbilityExtensionList_1600');
      accessibility.getAccessibilityExtensionList('all', 'disable').then((result) => {
        console.info(`AccessibilityErrCodeTest: AbilityExtensionList_1600 result ${result.length}`);
        expect(Array.isArray(result)).assertEqual(true);
        done();
      }).catch((err) => {
        console.error(`AccessibilityErrCodeTest: AbilityExtensionList_1600 has error: ${err}`);
        expect(null).assertFail();
        done();
      });
    })

    /*
    * @tc.number  AbilityExtensionList_1700
    * @tc.name    AbilityExtensionList_1700
    * @tc.desc    The parameters input are 'all' and 'install', test the getAccessibilityExtensionList()
    *             function, and the output is the list of AccessibilityAbilityInfo
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('AbilityExtensionList_1700', 0, async function (done) {
      console.info('AbilityExtensionList_1700');
      accessibility.getAccessibilityExtensionList('all', 'install', (err, data) => {
        if (err && err.code != 0) {
          console.error(`AccessibilityErrCodeTest: AbilityExtensionList_1700 has error: ${err.code}`);
          expect(null).assertFail();
          done();
        }
        console.info(`AccessibilityErrCodeTest: AbilityExtensionList_1700 result ${data.length}`);
        expect(Array.isArray(data)).assertEqual(true);
        done();
      });
    })

    /*
    * @tc.number  AbilityExtensionList_1800
    * @tc.name    AbilityExtensionList_1800
    * @tc.desc    The parameters input are 'all' and 'install', test the getAccessibilityExtensionList() function,
    *             and the output is the list of AccessibilityAbilityInfo
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('AbilityExtensionList_1800', 0, async function (done) {
      console.info('AbilityExtensionList_1800');
      accessibility.getAccessibilityExtensionList('all', 'install').then((result) => {
        console.info(`AccessibilityErrCodeTest: AbilityExtensionList_1800 result ${result.length}`);
        expect(Array.isArray(result)).assertEqual(true);
        done();
      }).catch((err) => {
        console.error(`AccessibilityErrCodeTest: AbilityExtensionList_1800 has error: ${err}`);
        expect(null).assertFail();
        done();
      });
    })

    /*
    * @tc.number  AccessibilityEventInfo_0100
    * @tc.name    AccessibilityEventInfo_0100
    * @tc.desc    test Accessibility EventInfo
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('AccessibilityEventInfo_0100', 0, async function (done) {
      let eventInfo = new accessibility.EventInfo({
        'type': 'click',
        'bundleName': 'com.example.MyApplication',
        'triggerAction': 'click'
      });
      expect(eventInfo != null).assertTrue();
      done();
    })


    /*
    * @tc.number  AccessibilitySendEventCallBack_0100
    * @tc.name    AccessibilitySendEventCallBack_0100
    * @tc.desc    test Accessibility SendEvent CallBack
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('AccessibilitySendEventCallBack_0100', 0, async function (done) {
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
    /*
    * @tc.number  AbilityCapability_0100
    * @tc.name    AbilityCapability_0100
    * @tc.desc    test Ability Capability
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('AbilityCapability_0100', 0, async function (done) {
      accessibility.getAbilityLists('audible', 'enable', (err, data) => {
        if (err) {
          console.error('failed to get accessibility extension list because ' + JSON.stringify(err));
          done();
          return;
        }
        for (let accessibilityAbilityInfo of data) {
          expect(accessibilityAbilityInfo.capabilities.length >= 0).assertTrue();
          expect(accessibilityAbilityInfo.abilityTypes.length >= 0).assertTrue();
          expect(accessibilityAbilityInfo.eventTypes.length >= 0).assertTrue();
          expect(accessibilityAbilityInfo.targetBundleNames.length >= 0).assertTrue();
          expect(accessibilityAbilityInfo.bundleName != null).assertTrue();
          expect(accessibilityAbilityInfo.description != null).assertTrue();
          expect(accessibilityAbilityInfo.id != null).assertTrue();
          expect(accessibilityAbilityInfo.name != null).assertTrue();
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
        console.info('get accessibility extension list success');
        done();
      })
    })

    /*
    * @tc.number  AbilityCaptionsManager_0100
    * @tc.name    AbilityCaptionsManager_0100
    * @tc.desc    test Ability Captions Manager
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('AbilityCaptionsManager_0100', 0, async function (done) {
      let captionsManager = accessibility.getCaptionsManager();
      expect(captionsManager.enabled == true || captionsManager.enabled == false).assertTrue();
      expect(captionsManager.style != null).assertTrue();
      expect(captionsManager.style.backgroundColor != null).assertTrue();
      expect(captionsManager.style.fontColor != null).assertTrue();
      expect(captionsManager.style.fontEdgeType != null).assertTrue();
      expect(captionsManager.style.fontFamily != null).assertTrue();
      expect(captionsManager.style.fontScale != null).assertTrue();
      expect(captionsManager.style.windowColor != null).assertTrue();
      done();
    })

    /*
    * @tc.number  GesturePathAndPoint_0100
    * @tc.name    GesturePathAndPoint_0100
    * @tc.desc    test GesturePath And GesturePoint
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('GesturePathAndPoint_0100', 0, async function (done) {
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
      setTimeout("", 3000);
    }

    /*
    * @tc.number  AccessibilitySetTargetBundleName_0100
    * @tc.name    AccessibilitySetTargetBundleName_0100
    * @tc.desc    test AccessibilitySetTargetBundleName
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('AccessibilitySetTargetBundleName_0100', 0, async function (done) {
      init();
      if (axContext != null) {
        let targetNames = ['com.ohos.xyz'];
        try {
          axContext.setTargetBundleName(targetNames).then(() => {
            done();
          }).catch((err) => {
            console.info('AccessibilitySetTargetBundleName_0100 err:' + JSON.stringify(err));
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

    /*
    * @tc.number  AccessibilitySetTargetBundleName_0200
    * @tc.name    AccessibilitySetTargetBundleName_0200
    * @tc.desc    test AccessibilitySetTargetBundleName
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('AccessibilitySetTargetBundleName_0200', 0, async function (done) {
      if (axContext != null) {
        let targetNames = ['com.ohos.xyz'];
        try {
          axContext.setTargetBundleName(targetNames, (err, data) => {
            console.info('AccessibilitySetTargetBundleName_0200 err' + JSON.stringify(err) + ' data:' + JSON.stringify(data));
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

    /*
    * @tc.number  AccessibilityGetFocusElement_0100
    * @tc.name    AccessibilityGetFocusElement_0100
    * @tc.desc    test AccessibilityGetFocusElement
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('AccessibilityGetFocusElement_0100', 0, async function (done) {
      if (axContext != null) {
        try {
          axContext.getFocusElement().then((rootElement) => {
            console.info('AccessibilityGetFocusElement_0100 rootElement:' + JSON.stringify(rootElement));
            rootElement.attributeNames().then((data) => {
              console.log('get attribute names success');
              if (data != null) {
                expect(data.rect.left != -1).assertTrue();
                expect(data.rect.top != -1).assertTrue();
                expect(data.rect.width != -1).assertTrue();
                expect(data.rect.height != -1).assertTrue();
              }
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
            done();
          }).catch((err) => {
            console.info('AccessibilityGetFocusElement_0100 err:' + JSON.stringify(err));
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
    /*
    * @tc.number  AccessibilityGetFocusElement_0200
    * @tc.name    AccessibilityGetFocusElement_0200
    * @tc.desc    test AccessibilityGetFocusElement
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('AccessibilityGetFocusElement_0200', 0, async function (done) {
      if (axContext != null) {
        try {
          axContext.getFocusElement((err, rootElement) => {
            if (err) {
              console.error('failed to get focus element, because ' + JSON.stringify(err));
              done();
              return;
            }
            rootElement.attributeNames((err, data) => {
              console.info('AccessibilityGetFocusElement_0200 err' + JSON.stringify(err) + ' data:' + JSON.stringify(data));
            });
            rootElement.attributeValue('name', (err, data) => {
              console.info('AccessibilityGetFocusElement_0200 err' + JSON.stringify(err) + ' data:' + JSON.stringify(data));
            });
            rootElement.actionNames((err, data) => {
              console.info('AccessibilityGetFocusElement_0200 err' + JSON.stringify(err) + ' data:' + JSON.stringify(data));
            });
            rootElement.performAction('action', (err, data) => {
              console.info('AccessibilityGetFocusElement_0200 err' + JSON.stringify(err) + ' data:' + JSON.stringify(data));
            });
            let actionName = 'action';
            let parameters = {
              'setText': 'test text'
            };
            rootElement.performAction(actionName, parameters, (err, data) => {
              console.info('AccessibilityGetFocusElement_0200 err' + JSON.stringify(err) + ' data:' + JSON.stringify(data));
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
    /*
    * @tc.number  AccessibilityGetFocusElement_0300
    * @tc.name    AccessibilityGetFocusElement_0300
    * @tc.desc    test AccessibilityGetFocusElement
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('AccessibilityGetFocusElement_0300', 0, async function (done) {
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
              console.info('AccessibilityGetFocusElement_0300 err' + JSON.stringify(err) + ' data:' + JSON.stringify(data));
            });
            rootElement.findElement('focusType', 'normal').then((data) => {
              console.log('data' + JSON.stringify(data));
            }).catch((err) => {
              console.log('failed to find element, because ' + JSON.stringify(err));
            });
            rootElement.findElement('focusType', 'normal', (err, data) => {
              console.info('AccessibilityGetFocusElement_0300 err' + JSON.stringify(err) + ' data:' + JSON.stringify(data));
            });
            rootElement.findElement('focusDirection', 'up').then((data) => {
              console.log('data' + JSON.stringify(data));
            }).catch((err) => {
              console.log('failed to find element, because ' + JSON.stringify(err));
            });
            rootElement.findElement('focusDirection', 'up', (err, data) => {
              console.info('AccessibilityGetFocusElement_0300 err' + JSON.stringify(err) + ' data:' + JSON.stringify(data));
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

    /*
    * @tc.number  AccessibilityGetWindowRootElement_0100
    * @tc.name    AccessibilityGetWindowRootElement_0100
    * @tc.desc    test AccessibilityGetWindowRootElement
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('AccessibilityGetWindowRootElement_0100', 0, async function (done) {
      if (axContext != null) {
        try {
          axContext.getWindowRootElement().then((data) => {
            console.info('AccessibilityGetWindowRootElement_0100 data:' + JSON.stringify(data));
            done();
          }).catch((err) => {
            console.info('AccessibilityGetWindowRootElement_0100 err:' + JSON.stringify(err));
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


    /*
    * @tc.number  AccessibilityGetWindowRootElement_0200
    * @tc.name    AccessibilityGetWindowRootElement_0200
    * @tc.desc    test AccessibilityGetWindowRootElement
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('AccessibilityGetWindowRootElement_0200', 0, async function (done) {
      if (axContext != null) {
        try {
          axContext.getWindowRootElement((err, data) => {
            console.info('AccessibilityGetWindowRootElement_0200 err' + JSON.stringify(err) + ' data:' + JSON.stringify(data));
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


    /*
    * @tc.number  AccessibilityGetWindowRootElement_0300
    * @tc.name    AccessibilityGetWindowRootElement_0300
    * @tc.desc    test AccessibilityGetWindowRootElement
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('AccessibilityGetWindowRootElement_0300', 0, async function (done) {
      if (axContext != null) {
        let windowId = 10;
        try {
          axContext.getWindowRootElement(windowId, (err, data) => {
            console.info('AccessibilityGetWindowRootElement_0300 err' + JSON.stringify(err) + ' data:' + JSON.stringify(data));
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


    /*
    * @tc.number  AccessibilityGetWindows_0100
    * @tc.name    AccessibilityGetWindows_0100
    * @tc.desc    test AccessibilityGetWindows
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('AccessibilityGetWindows_0100', 0, async function (done) {
      if (axContext != null) {
        try {
          axContext.getWindows().then((data) => {
            console.info('AccessibilityGetWindows_0100  data:' + JSON.stringify(data));
            done();
          }).catch((err) => {
            console.info('AccessibilityGetWindows_0100 err' + JSON.stringify(err));
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


    /*
    * @tc.number  AccessibilityGetWindows_0200
    * @tc.name    AccessibilityGetWindows_0200
    * @tc.desc    test AccessibilityGetWindows
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('AccessibilityGetWindows_0200', 0, async function (done) {
      if (axContext != null) {
        try {
          axContext.getWindows((err, data) => {
            console.info('AccessibilityGetWindows_0200 err' + JSON.stringify(err) + ' data:' + JSON.stringify(data));
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


    /*
    * @tc.number  AccessibilityGetWindows_0300
    * @tc.name    AccessibilityGetWindows_0300
    * @tc.desc    test AccessibilityGetWindows
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('AccessibilityGetWindows_0300', 0, async function (done) {
      if (axContext != null) {
        let displayId = 10;
        try {
          axContext.getWindows(displayId, (err, data) => {
            console.info('AccessibilityGetWindows_0300 err' + JSON.stringify(err) + ' data:' + JSON.stringify(data));
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


    /*
    * @tc.number  AccessibilityInjectGesture_0100
    * @tc.name    AccessibilityInjectGesture_0100
    * @tc.desc    test AccessibilityInjectGesture
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('AccessibilityInjectGesture_0100', 0, async function (done) {
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
            console.info('AccessibilityInjectGesture_0100 err' + JSON.stringify(err));
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


    /*
    * @tc.number  AccessibilityInjectGesture_0200
    * @tc.name    AccessibilityInjectGesture_0200
    * @tc.desc    test AccessibilityInjectGesture
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('AccessibilityInjectGesture_0200', 0, async function (done) {
      if (axContext != null) {
        let gesturePath = new GesturePath.GesturePath(100);
        try {
          for (let i = 0; i < 10; i++) {
            let gesturePoint = new GesturePoint.GesturePoint(100, i * 200);
            gesturePath.points.push(gesturePoint);
          }
          axContext.injectGesture(gesturePath, (err, data) => {
            console.info('AccessibilityInjectGesture_0200 err' + JSON.stringify(err) + ' data:' + JSON.stringify(data));
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
  })
}