/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { Driver, ON, MatchPattern } from '@ohos.UiTest'
import { abilityDelegatorRegistry } from '@kit.TestKit';
import common from '@ohos.app.ability.common';
import CompletionHandler from '@ohos.app.ability.CompletionHandler';
import bundleManager from '@ohos.bundle.bundleManager';
import { BusinessError } from '@ohos.base'

const DOMAIN = 0x0000;
const LOG_TAG = 'COMPLETION_HANDLER_TEST';
const DELAY_TIME = 2000;

let sleep = async (millis: number) => {
  return new Promise<void>(resolve => setTimeout(resolve, millis));
}

let testContext: common.UIAbilityContext;
let supportSceneBoard: boolean = false;
let buttonClicked: boolean = false;
let isOpen: boolean = false;
let driver = Driver.create();

let openDialog = async (dialogKey: string, text: string) => {
  let allowed = await driver.waitForComponent(ON.text(dialogKey, MatchPattern.CONTAINS), DELAY_TIME);
  hilog.info(DOMAIN, LOG_TAG, 'needAllow: %{public}s', JSON.stringify(allowed));
  if (allowed) {
    if (dialogKey.indexOf('选择打开方式') >= 0) {
      let moreButtons = await driver.findComponents(ON.text('更多打开方式', MatchPattern.CONTAINS));
      if (moreButtons && moreButtons.length > 0) {
        hilog.info(DOMAIN, LOG_TAG, 'clicking 更多打开方式');
        await moreButtons[moreButtons.length -1].click();
        hilog.info(DOMAIN, LOG_TAG, '更多打开方式 clicked');
      }
      await sleep(500);
    }
    let buttons = await driver.findComponents(ON.text(text, MatchPattern.CONTAINS));
    if (buttons && buttons.length > 0) {
      hilog.info(DOMAIN, LOG_TAG, 'buttons.length: %{public}d', buttons.length);
      hilog.info(DOMAIN, LOG_TAG, 'clicking %{public}s', text);
      await buttons[buttons.length - 1].click();
      hilog.info(DOMAIN, LOG_TAG, '%{public}s clicked', text);
      buttonClicked = true;
    } else {
      hilog.info(DOMAIN, LOG_TAG, 'button %{public}s not found', text);
    }
  }
}

let closeDialog = async (dialogKey: string) => {
  let allowed = await driver.waitForComponent(ON.text(dialogKey, MatchPattern.CONTAINS), DELAY_TIME);
  hilog.info(DOMAIN, LOG_TAG, 'needAllow: %{public}s', JSON.stringify(allowed));
  if (allowed) {
    let buttons = await driver.findComponents(ON.type('SymbolGlyph'));
    if (buttons && buttons.length > 0) {
      await buttons[0].click();
      buttonClicked = true;
    }
  }
}

let allowOpen = async () => {
  let allowed = await driver.waitForComponent(ON.text('想要打开', MatchPattern.CONTAINS), DELAY_TIME);
  hilog.info(DOMAIN, LOG_TAG, 'needAllow: %{public}s', JSON.stringify(allowed));
  if (allowed) {
    let buttons = await driver.findComponents(ON.text('本次允许', MatchPattern.CONTAINS));
    if (buttons && buttons.length > 0) {
      hilog.info(DOMAIN, LOG_TAG, 'buttons.length: %{public}d', buttons.length);
      hilog.info(DOMAIN, LOG_TAG, 'clicking %{public}s', '本次允许');
      await buttons[buttons.length - 1].click();
      hilog.info(DOMAIN, LOG_TAG, '%{public}s clicked', '本次允许');
      buttonClicked = true;
      return;
    }
    buttons = await driver.findComponents(ON.text('允许', MatchPattern.CONTAINS));
    if (buttons && buttons.length > 0) {
      hilog.info(DOMAIN, LOG_TAG, 'buttons.length: %{public}d', buttons.length);
      hilog.info(DOMAIN, LOG_TAG, 'clicking %{public}s', '允许');
      await buttons[buttons.length - 1].click();
      hilog.info(DOMAIN, LOG_TAG, '%{public}s clicked', '允许');
      buttonClicked = true;
      return;
    }

    hilog.info(DOMAIN, LOG_TAG, 'button not found');
  }
}

let disallowOpen = async () => {
  let allowed = await driver.waitForComponent(ON.text('想要打开', MatchPattern.CONTAINS), DELAY_TIME);
  hilog.info(DOMAIN, LOG_TAG, 'needAllow: %{public}s', JSON.stringify(allowed));
  if (allowed) {
    let buttons = await driver.findComponents(ON.text('不允许', MatchPattern.CONTAINS));
    if (buttons && buttons.length > 0) {
      hilog.info(DOMAIN, LOG_TAG, 'buttons.length: %{public}d', buttons.length);
      hilog.info(DOMAIN, LOG_TAG, 'clicking %{public}s', '不允许');
      await buttons[buttons.length - 1].click();
      hilog.info(DOMAIN, LOG_TAG, '%{public}s clicked', '不允许');
      buttonClicked = true;
      return;
    }
    buttons = await driver.findComponents(ON.text('取消', MatchPattern.CONTAINS));
    if (buttons && buttons.length > 0) {
      hilog.info(DOMAIN, LOG_TAG, 'buttons.length: %{public}d', buttons.length);
      hilog.info(DOMAIN, LOG_TAG, 'clicking %{public}s', '取消');
      await buttons[buttons.length - 1].click();
      hilog.info(DOMAIN, LOG_TAG, '%{public}s clicked', '取消');
      buttonClicked = true;
      return;
    }

    hilog.info(DOMAIN, LOG_TAG, 'button not found');
  }
}

export default function AbilityRuntimeCompletionHandlerStartAbilityForResultTest() {
  describe('AbilityRuntimeCompletionHandlerStartAbilityForResultTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async (done: Function) => {
      try {
        const ability = await abilityDelegatorRegistry.getAbilityDelegator().getCurrentTopAbility();
        testContext = ability.context;
      } catch (err) {
        hilog.info(DOMAIN, LOG_TAG, "get context failed: " + JSON.stringify(err));
        try { expect().assertFail(); } catch (err) {}
      }
      try {
        let dumpRet = await abilityDelegatorRegistry.getAbilityDelegator().executeShellCommand('aa dump -r');
        hilog.info(DOMAIN, LOG_TAG, 'aa dump ret: %{public}s', JSON.stringify(dumpRet));
        if (dumpRet.stdResult.includes('com.ohos.sceneboard')) {
          supportSceneBoard = true;
        }
      } catch (err) {
        hilog.info(DOMAIN, LOG_TAG, 'getBundleInfo failed: %{public}s', JSON.stringify(err));
      }
      done();
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      buttonClicked = false;
      isOpen = true;
    })
    afterEach(async (done: Function) => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
      await sleep(5000);
      done();
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /*
     * @tc.number : SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0100
     * @tc.name : SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0100
     * @tc.desc   : explicitly start another app and allow
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0100', Level.LEVEL3, async(done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(DOMAIN, LOG_TAG, '%{public}s', 'SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0100 begin');
      if (!supportSceneBoard) {
        hilog.info(DOMAIN, LOG_TAG, '%{public}s', `SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0100 sceneboard is not supported`);
        done();
        return;
      }

      let handler: CompletionHandler = {
        onRequestSuccess: (element: bundleManager.ElementName, message: string) => {
          hilog.info(DOMAIN, LOG_TAG, '%{public}s', `SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0100 onRequestSuccess called,
            element: ${JSON.stringify(element)}, message: ${message}`);
          expect(element.bundleName).assertEqual('com.example.completionhandlerrely');
          expect(element.abilityName).assertEqual('EntryAbility');
          expect(message).assertContain('Succeeded');
          done();
        },
        onRequestFailure: (element: bundleManager.ElementName, message: string) => {
          hilog.info(DOMAIN, LOG_TAG, '%{public}s', `SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0100 onRequestFailure called,
            element: ${JSON.stringify(element)}, message: ${message}`);
          expect().assertFail();
          done();
        }
      }

      try {
        testContext.startAbilityForResult({
          bundleName: "com.example.completionhandlerrely",
          abilityName: "EntryAbility"
        }, {
          completionHandler: handler
        }).then(() => {
          hilog.info(DOMAIN, LOG_TAG, '%{public}s', 'SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0100 startAbility succeeded');
        }).catch((err: BusinessError) => {
          hilog.error(DOMAIN, LOG_TAG, '%{public}s', `SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0100 startAbility failed, err=${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
      } catch (e) {
        hilog.error(DOMAIN, LOG_TAG, '%{public}s', `SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0100 startAbility failed, ${JSON.stringify(e)}`);
        expect().assertFail();
        done();
      }
      await sleep(500);

      try {
        await allowOpen();
      } catch (e) {
        hilog.error(DOMAIN, LOG_TAG, '%{public}s', `SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0100 allowOpen failed, ${JSON.stringify(e)}`);
        expect().assertFail();
        done();
      }

      hilog.info(DOMAIN, LOG_TAG, '%{public}s', 'SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0100 end');
    })

    /*
     * @tc.number : SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0200
     * @tc.name : SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0200
     * @tc.desc   : explicitly start another app but disallow
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0200', Level.LEVEL3, async(done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(DOMAIN, LOG_TAG, '%{public}s', 'SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0200 begin');
      if (!supportSceneBoard) {
        hilog.info(DOMAIN, LOG_TAG, '%{public}s', `SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0200 sceneboard is not supported`);
        done();
        return;
      }

      let handler: CompletionHandler = {
        onRequestSuccess: (element: bundleManager.ElementName, message: string) => {
          hilog.info(DOMAIN, LOG_TAG, '%{public}s', `SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0200 onRequestSuccess called,
            element: ${JSON.stringify(element)}, message: ${message}`);
          if (buttonClicked) {
            expect().assertFail();
          }
          done();
        },
        onRequestFailure: (element: bundleManager.ElementName, message: string) => {
          hilog.info(DOMAIN, LOG_TAG, '%{public}s', `SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0200 onRequestFailure called,
            element: ${JSON.stringify(element)}, message: ${message}`);
          expect(element.bundleName).assertEqual('com.example.completionhandlerrely');
          expect(element.abilityName).assertEqual('EntryAbility');
          expect(message).assertContain('User refused redirection');
          done();
        }
      }

      try {
        testContext.startAbilityForResult({
          bundleName: "com.example.completionhandlerrely",
          abilityName: "EntryAbility"
        }, {
          completionHandler: handler
        }).then(() => {
          hilog.info(DOMAIN, LOG_TAG, '%{public}s', 'SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0200 startAbility succeeded');
        }).catch((err: BusinessError) => {
          hilog.error(DOMAIN, LOG_TAG, '%{public}s', `SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0200 startAbility failed, err=${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
      } catch (e) {
        hilog.error(DOMAIN, LOG_TAG, '%{public}s', `SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0200 startAbility failed, ${JSON.stringify(e)}`);
        expect().assertFail();
        done();
      }
      await sleep(500);

      try {
        await disallowOpen();
      } catch (e) {
        hilog.error(DOMAIN, LOG_TAG, '%{public}s', `SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0200 disallowOpen failed, ${JSON.stringify(e)}`);
        expect().assertFail();
        done();
      }

      hilog.info(DOMAIN, LOG_TAG, '%{public}s', 'SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0200 end');
    })

    /*
     * @tc.number : SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0300
     * @tc.name : SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0300
     * @tc.desc   : implicitly start another app and open
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0300', Level.LEVEL3, async(done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(DOMAIN, LOG_TAG, '%{public}s', 'SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0300 begin');
      if (!supportSceneBoard) {
        hilog.info(DOMAIN, LOG_TAG, '%{public}s', `SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0300 sceneboard is not supported`);
        done();
        return;
      }

      let handler: CompletionHandler = {
        onRequestSuccess: (element: bundleManager.ElementName, message: string) => {
          hilog.info(DOMAIN, LOG_TAG, '%{public}s', `SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0300 onRequestSuccess called,
            element: ${JSON.stringify(element)}, message: ${message}`);
          expect(element.bundleName).assertEqual('com.example.completionhandlerrely');
          expect(element.abilityName).assertEqual('EntryAbility');
          expect(message).assertContain('Succeeded');
          done();
        },
        onRequestFailure: (element: bundleManager.ElementName, message: string) => {
          hilog.info(DOMAIN, LOG_TAG, '%{public}s', `SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0300 onRequestFailure called,
            element: ${JSON.stringify(element)}, message: ${message}`);
          if(message.indexOf('Failed to call startAbility') != -1){
            done();
          }else{
            expect().assertFail();
            done();
          }
        }
      }

      try {
        testContext.startAbilityForResult({
          entities: ['entity.system.home']
        }, {
          completionHandler: handler
        }).then(() => {
          hilog.info(DOMAIN, LOG_TAG, '%{public}s', 'SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0300 startAbility succeeded');
        }).catch((err: BusinessError) => {
          hilog.error(DOMAIN, LOG_TAG, '%{public}s', `SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0300 startAbility failed, err=${JSON.stringify(err)}`);
          isOpen = false;
          if(err?.code == 16000050){}else{
            expect().assertFail();
            done();
          }
        })
      } catch (e) {
        hilog.error(DOMAIN, LOG_TAG, '%{public}s', `SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0300 startAbility failed, ${JSON.stringify(e)}`);
        expect().assertFail();
        done();
      }
      await sleep(500);
      if(isOpen){
        try {
          await openDialog('选择打开方式', 'CompletionHandlerRely');
        } catch (e) {
          hilog.error(DOMAIN, LOG_TAG, '%{public}s', `SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0300 openDialog failed, ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      }
      hilog.info(DOMAIN, LOG_TAG, '%{public}s', 'SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0300 end');
    })

    /*
     * @tc.number : SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0400
     * @tc.name : SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0400
     * @tc.desc   : implicitly start another app and close dialog
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0400', Level.LEVEL3, async(done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(DOMAIN, LOG_TAG, '%{public}s', 'SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0400 begin');
      if (!supportSceneBoard) {
        hilog.info(DOMAIN, LOG_TAG, '%{public}s', `SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0400 sceneboard is not supported`);
        done();
        return;
      }

      let handler: CompletionHandler = {
        onRequestSuccess: (element: bundleManager.ElementName, message: string) => {
          hilog.info(DOMAIN, LOG_TAG, '%{public}s', `SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0400 onRequestSuccess called,
            element: ${JSON.stringify(element)}, message: ${message}`);
          expect().assertFail();
          done();
        },
        onRequestFailure: (element: bundleManager.ElementName, message: string) => {
          hilog.info(DOMAIN, LOG_TAG, '%{public}s', `SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0400 onRequestFailure called,
            element: ${JSON.stringify(element)}, message: ${message}`);
          if(message.indexOf('Failed to call startAbility') != -1){
            done();
          }else{
            expect(element.bundleName.length).assertEqual(0);
            expect(element.abilityName.length).assertEqual(0);
            expect(message).assertContain('User closed the implicit startup picker');
            done();
          }
        }
      }

      try {
        testContext.startAbilityForResult({
          entities: ['entity.system.home']
        }, {
          completionHandler: handler
        }).then(() => {
          hilog.info(DOMAIN, LOG_TAG, '%{public}s', 'SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0400 startAbility succeeded');
        }).catch((err: BusinessError) => {
          hilog.error(DOMAIN, LOG_TAG, '%{public}s', `SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0400 startAbility failed, err=${JSON.stringify(err)}`);
          isOpen = false;
          if(err?.code == 16000050){}else{
            expect().assertFail();
            done();
          }
        })
      } catch (e) {
        hilog.error(DOMAIN, LOG_TAG, '%{public}s', `SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0400 startAbility failed, ${JSON.stringify(e)}`);
        expect().assertFail();
        done();
      }
      await sleep(500);
      if(isOpen){
        try {
          await closeDialog('选择打开方式');
        } catch (e) {
          hilog.error(DOMAIN, LOG_TAG, '%{public}s', `SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0400 closeDialog failed, ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      }
      hilog.info(DOMAIN, LOG_TAG, '%{public}s', 'SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0400 end');
    })

    /*
     * @tc.number : SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0500
     * @tc.name : SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0500
     * @tc.desc   : implicitly start non-existent app
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0500', Level.LEVEL3, async(done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(DOMAIN, LOG_TAG, '%{public}s', 'SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0500 begin');
      if (!supportSceneBoard) {
        hilog.info(DOMAIN, LOG_TAG, '%{public}s', `SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0500 sceneboard is not supported`);
        done();
        return;
      }

      let handler: CompletionHandler = {
        onRequestSuccess: (element: bundleManager.ElementName, message: string) => {
          hilog.info(DOMAIN, LOG_TAG, '%{public}s', `SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0500 onRequestSuccess called,
            element: ${JSON.stringify(element)}, message: ${message}`);
          expect().assertFail();
          done();
        },
        onRequestFailure: (element: bundleManager.ElementName, message: string) => {
          hilog.info(DOMAIN, LOG_TAG, '%{public}s', `SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0500 onRequestFailure called,
            element: ${JSON.stringify(element)}, message: ${message}`);
            expect(element.bundleName.length).assertEqual(0);
            expect(element.abilityName.length).assertEqual(0);
            expect(message).assertContain('Failed to call startAbility');
            done();
        }
      }

      try {
        testContext.startAbilityForResult({
          entities: ['entity.that.definitely.not.exist']
        }, {
          completionHandler: handler
        }).then(() => {
          hilog.info(DOMAIN, LOG_TAG, '%{public}s', 'SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0500 startAbility succeeded');
        }).catch((err: BusinessError) => {
          hilog.error(DOMAIN, LOG_TAG, '%{public}s', `SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0500 startAbility failed, err=${JSON.stringify(err)}`);
        })
      } catch (e) {
        hilog.error(DOMAIN, LOG_TAG, '%{public}s', `SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0500 startAbility failed, ${JSON.stringify(e)}`);
      }
      await sleep(500);
      if(isOpen){
        try {
          await openDialog('暂无可用打开方式', '知道了');
        } catch (e) {
          hilog.error(DOMAIN, LOG_TAG, '%{public}s', `SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0500 openDialog failed, ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      }
      hilog.info(DOMAIN, LOG_TAG, '%{public}s', 'SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0500 end');
    })

    /*
     * @tc.number : SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0600
     * @tc.name : SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0600
     * @tc.desc   : implicitly start app via unique entity and allow open
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0600', Level.LEVEL3, async(done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(DOMAIN, LOG_TAG, '%{public}s', 'SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0600 begin');
      if (!supportSceneBoard) {
        hilog.info(DOMAIN, LOG_TAG, '%{public}s', `SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0600 sceneboard is not supported`);
        done();
        return;
      }

      let handler: CompletionHandler = {
        onRequestSuccess: (element: bundleManager.ElementName, message: string) => {
          hilog.info(DOMAIN, LOG_TAG, '%{public}s', `SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0600 onRequestSuccess called,
            element: ${JSON.stringify(element)}, message: ${message}`);
          expect(element.bundleName).assertEqual('com.example.completionhandlerrely');
          expect(element.abilityName).assertEqual('EntryAbility');
          expect(message).assertContain('Succeeded');
          done();
        },
        onRequestFailure: (element: bundleManager.ElementName, message: string) => {
          hilog.info(DOMAIN, LOG_TAG, '%{public}s', `SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0600 onRequestFailure called,
            element: ${JSON.stringify(element)}, message: ${message}`);
          if(message.indexOf('Failed to call startAbility') != -1){
            done();
          }else{
            expect().assertFail();
            done();
          }
        }
      }

      try {
        testContext.startAbilityForResult({
          entities: ['unique.completion.handler.reply.entity']
        }, {
          completionHandler: handler
        }).then(() => {
          hilog.info(DOMAIN, LOG_TAG, '%{public}s', 'SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0600 startAbility succeeded');
        }).catch((err: BusinessError) => {
          hilog.error(DOMAIN, LOG_TAG, '%{public}s', `SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0600 startAbility failed, err=${JSON.stringify(err)}`);
          isOpen = false;
          if(err?.code == 16000050){}else{
            expect().assertFail();
            done();
          }
        })
      } catch (e) {
        hilog.error(DOMAIN, LOG_TAG, '%{public}s', `SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0600 startAbility failed, ${JSON.stringify(e)}`);
        expect().assertFail();
        done();
      }
      await sleep(500);
      if(isOpen){
        try {
          await allowOpen();
        } catch (e) {
          hilog.error(DOMAIN, LOG_TAG, '%{public}s', `SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0600 allowOpen failed, ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      }
      hilog.info(DOMAIN, LOG_TAG, '%{public}s', 'SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0600 end');
    })

    /*
     * @tc.number : SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0700
     * @tc.name : SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0700
     * @tc.desc   : implicitly start app via unique entity but disallow
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0700', Level.LEVEL3, async(done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(DOMAIN, LOG_TAG, '%{public}s', 'SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0700 begin');
      if (!supportSceneBoard) {
        hilog.info(DOMAIN, LOG_TAG, '%{public}s', `SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0700 sceneboard is not supported`);
        done();
        return;
      }

      let handler: CompletionHandler = {
        onRequestSuccess: (element: bundleManager.ElementName, message: string) => {
          hilog.info(DOMAIN, LOG_TAG, '%{public}s', `SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0700 onRequestSuccess called,
            element: ${JSON.stringify(element)}, message: ${message}`);
          if (buttonClicked) {
            expect().assertFail();
          }
          done();
        },
        onRequestFailure: (element: bundleManager.ElementName, message: string) => {
          hilog.info(DOMAIN, LOG_TAG, '%{public}s', `SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0700 onRequestFailure called,
            element: ${JSON.stringify(element)}, message: ${message}`);
          if(message.indexOf('Failed to call startAbility') != -1){
            done();
          }else{
            expect(element.bundleName).assertEqual('com.example.completionhandlerrely');
            expect(element.abilityName).assertEqual('EntryAbility');
            expect(message).assertContain('User refused redirection');
            done();
          }
        }
      }

      try {
        testContext.startAbilityForResult({
          entities: ['unique.completion.handler.reply.entity']
        }, {
          completionHandler: handler
        }).then(() => {
          hilog.info(DOMAIN, LOG_TAG, '%{public}s', 'SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0700 startAbility succeeded');
        }).catch((err: BusinessError) => {
          hilog.error(DOMAIN, LOG_TAG, '%{public}s', `SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0700 startAbility failed, err=${JSON.stringify(err)}`);
          isOpen = false;
          if(err?.code == 16000050){}else{
            expect().assertFail();
            done();
          }
        })
      } catch (e) {
        hilog.error(DOMAIN, LOG_TAG, '%{public}s', `SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0700 startAbility failed, ${JSON.stringify(e)}`);
        expect().assertFail();
        done();
      }
      await sleep(500);
      if(isOpen){
        try {
          await disallowOpen();
        } catch (e) {
          hilog.error(DOMAIN, LOG_TAG, '%{public}s', `SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0700 disallowOpen failed, ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      }
      hilog.info(DOMAIN, LOG_TAG, '%{public}s', 'SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0700 end');
    })

    /*
     * @tc.number : SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0800
     * @tc.name : SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0800
     * @tc.desc   : open a different ability within app
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0800', Level.LEVEL3, async(done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(DOMAIN, LOG_TAG, '%{public}s', 'SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0800 begin');
      if (!supportSceneBoard) {
        hilog.info(DOMAIN, LOG_TAG, '%{public}s', `SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0800 sceneboard is not supported`);
        done();
        return;
      }

      let handler: CompletionHandler = {
        onRequestSuccess: (element: bundleManager.ElementName, message: string) => {
          hilog.info(DOMAIN, LOG_TAG, '%{public}s', `SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0800 onRequestSuccess called,
            element: ${JSON.stringify(element)}, message: ${message}`);
          expect(element.bundleName).assertEqual('com.example.completionhandlertest');
          expect(element.abilityName).assertEqual('Ability2');
          expect(message).assertContain('Succeeded');
          done();
        },
        onRequestFailure: (element: bundleManager.ElementName, message: string) => {
          hilog.info(DOMAIN, LOG_TAG, '%{public}s', `SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0800 onRequestFailure called,
            element: ${JSON.stringify(element)}, message: ${message}`);
          expect().assertFail();
          done();
        }
      }

      try {
        testContext.startAbilityForResult({
          bundleName: 'com.example.completionhandlertest',
          abilityName: 'Ability2',
        }, {
          completionHandler: handler
        }).then(() => {
          hilog.info(DOMAIN, LOG_TAG, '%{public}s', 'SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0800 startAbility succeeded');
        }).catch((err: BusinessError) => {
          hilog.error(DOMAIN, LOG_TAG, '%{public}s', `SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0800 startAbility failed, err=${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
      } catch (e) {
        hilog.error(DOMAIN, LOG_TAG, '%{public}s', `SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0800 startAbility failed, ${JSON.stringify(e)}`);
        expect().assertFail();
        done();
      }
      await sleep(500);

      hilog.info(DOMAIN, LOG_TAG, '%{public}s', 'SUB_AbilityRuntime_CompletionHandlerTest_StartAbilityForResult_0800 end');
    })
  })
}