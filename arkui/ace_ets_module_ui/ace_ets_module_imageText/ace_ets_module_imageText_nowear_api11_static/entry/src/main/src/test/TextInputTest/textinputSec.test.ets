'use static';
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
import {
  $r,
  Resource,ResourceStr
} from '@ohos.arkui.component'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import {
  PasswordIcon} from '@ohos.arkui.component'
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

async function forKey(Key: string, text: string, icon?: PasswordIcon) {
  try {
    if (Key == "TextNum") {
      AppStorage.setOrCreate<ResourceStr | undefined>('showError',undefined)
    }
    if (Key == "TextStr") {
      AppStorage.setOrCreate<ResourceStr | undefined>('showError',text)
    }
    if (Key == "TextErr"&&text == 'null') {
      AppStorage.setOrCreate<ResourceStr | undefined>('showError',undefined)
    }
    if (Key == "TextErr"&&text == 'undefined') {
      AppStorage.setOrCreate<ResourceStr | undefined>('showError',undefined)
    }
    if (Key == "BoolTrue") {
      AppStorage.setOrCreate<boolean|undefined>('showUnderline',true)
    }
    if (Key == "BoolFalse") {
      AppStorage.setOrCreate<boolean|undefined>('showUnderline',false)
    }
    if (Key == "BoolErrNum") {
      AppStorage.setOrCreate<boolean|undefined>('showUnderline',false)
    }
    if (Key == "BoolErrStr") {
      AppStorage.setOrCreate<boolean|undefined>('showUnderline',false)
    }
    if (Key == "BoolErrNull" || Key == "BoolErrUndefined") {
      AppStorage.setOrCreate<boolean|undefined>('showUnderline',undefined)
    }
    if (Key == "passWordIcon") {
      AppStorage.setOrCreate<PasswordIcon|undefined>('passwordIcon',icon)
    }
  } catch (err) {
    console.info("emit emitKey  err: " + JSON.stringify(err));
  }
  await UtilsTest.msSleep(2000)
}
export default function textinputSec() {
  describe('textinputSec', () :void=> {
    beforeAll(() => {
      console.info("textinputSec beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("textinputSec beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextInput/TextinputSec",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get textinputSec state pages:" + "");
        if (!("TextinputSec" == pages.name)) {
          console.info("get textinputSec pages.name:" + "");
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push textinputSec page error:" + err);
      }
      console.info("textinputSec beforeEach end");
    });
        /**
     * @tc.number   ArkUX_Stage_TextInput_ShowUnderline_static_0100
     * @tc.name     ArkUX_Stage_TextInput_ShowUnderline_static_0100
     * @tc.desc     ArkUX_Stage_TextInput_ShowUnderline_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_ShowUnderline_static_0100', Level.LEVEL1, async (done: ()=>void) => {
      await forKey("BoolTrue", "");
        let strJson = inspector.getInspectorByKey('TextInput');
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0100 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0100 obj $attrs.showUnderline :' + JSON.stringify(obj.getElement('$attrs').getBoolean('showUnderline')));
        expect(obj.getElement('$attrs').getBoolean('showUnderline')).assertEqual(true);
        done()

    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_ShowUnderline_static_0200
     * @tc.name     ArkUX_Stage_TextInput_ShowUnderline_static_0200
     * @tc.desc     ArkUX_Stage_TextInput_ShowUnderline_static_0200
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_ShowUnderline_static_0200', Level.LEVEL1, async (done: ()=>void) => {
      await forKey("BoolFalse", "");
        let strJson = inspector.getInspectorByKey('TextInput');
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0200 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0200 obj $attrs.showUnderline :' + JSON.stringify(obj.getElement('$attrs').getBoolean('showUnderline')));
        expect(obj.getElement('$attrs').getBoolean('showUnderline')).assertEqual(false);
        done()
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_ShowUnderline_static_0300
     * @tc.name     ArkUX_Stage_TextInput_ShowUnderline_static_0300
     * @tc.desc     ArkUX_Stage_TextInput_ShowUnderline_static_0300
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_ShowUnderline_static_0300', Level.LEVEL1, async (done: ()=>void) => {
      await forKey("BoolErrNull", "");
        let strJson = inspector.getInspectorByKey('TextInput');
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0300 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0300 obj $attrs.showUnderline :' + JSON.stringify(obj.getElement('$attrs').getBoolean('showUnderline')));
        await UtilsTest.msSleep(5000)
        expect(obj.getElement('$attrs').getBoolean('showUnderline')).assertEqual(false);
        done()
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_ShowUnderline_static_0400
     * @tc.name     ArkUX_Stage_TextInput_ShowUnderline_static_0400
     * @tc.desc     ArkUX_Stage_TextInput_ShowUnderline_static_0400
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_ShowUnderline_static_0400', Level.LEVEL1, async (done: ()=>void) => {
      await forKey("BoolErrUndefined", "");
        let strJson = inspector.getInspectorByKey('TextInput');
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0400 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0400 obj $attrs.showUnderline :' + JSON.stringify(obj.getElement('$attrs').getBoolean('showUnderline')));
        expect(obj.getElement('$attrs').getBoolean('showUnderline')).assertEqual(false);
        done()
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_ShowUnderline_static_0500
     * @tc.name     ArkUX_Stage_TextInput_ShowUnderline_static_0500
     * @tc.desc     ArkUX_Stage_TextInput_ShowUnderline_static_0500
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_ShowUnderline_static_0500', Level.LEVEL1, async (done: ()=>void) => {
      await forKey("BoolErrStr", "");
        let strJson = inspector.getInspectorByKey('TextInput');
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0500 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0500 obj $attrs.showUnderline :' + JSON.stringify(obj.getElement('$attrs').getBoolean('showUnderline')));
        expect(obj.getElement('$attrs').getBoolean('showUnderline')).assertEqual(false);
        done()
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_ShowUnderline_static_0600
     * @tc.name     ArkUX_Stage_TextInput_ShowUnderline_static_0600
     * @tc.desc     ArkUX_Stage_TextInput_ShowUnderline_static_0600
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_ShowUnderline_static_0600', Level.LEVEL1, async (done: ()=>void) => {
      await forKey("BoolFalse", "");
      await forKey("BoolTrue", "");
        let strJson = inspector.getInspectorByKey('TextInput');
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0600 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0600 obj $attrs.showUnderline :' + JSON.stringify(obj.getElement('$attrs').getBoolean('showUnderline')));
        expect(obj.getElement('$attrs').getBoolean('showUnderline')).assertEqual(true);
        done()
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_ShowUnderline_static_0700
     * @tc.name     ArkUX_Stage_TextInput_ShowUnderline_static_0700
     * @tc.desc     ArkUX_Stage_TextInput_ShowUnderline_static_0700
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_ShowUnderline_static_0700', Level.LEVEL1, async (done: ()=>void) => {
      await forKey("BoolTrue", "");
      await forKey("BoolErrStr", "");
        let strJson = inspector.getInspectorByKey('TextInput');
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0700 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0700 obj $attrs.showUnderline :' + JSON.stringify(obj.getElement('$attrs').getBoolean('showUnderline')));
        expect(obj.getElement('$attrs').getBoolean('showUnderline')).assertEqual(false);
        done()
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_ShowUnderline_static_0800
     * @tc.name     ArkUX_Stage_TextInput_ShowUnderline_static_0800
     * @tc.desc     ArkUX_Stage_TextInput_ShowUnderline_static_0800
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_ShowUnderline_static_0800', Level.LEVEL1, async (done: ()=>void) => {
      await forKey("BoolErrStr", "");
      await forKey("BoolTrue", "");
        let strJson = inspector.getInspectorByKey('TextInput');
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0800 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0800 obj $attrs.showUnderline :' + JSON.stringify(obj.getElement('$attrs').getBoolean('showUnderline')));
        expect(obj.getElement('$attrs').getBoolean('showUnderline')).assertEqual(true);
        done()
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_ShowUnderline_static_0900
     * @tc.name     ArkUX_Stage_TextInput_ShowUnderline_static_0900
     * @tc.desc     ArkUX_Stage_TextInput_ShowUnderline_static_0900
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_ShowUnderline_static_0900', Level.LEVEL1, async (done: ()=>void) => {
      await forKey("BoolErrNum", "1");
      await UtilsTest.msSleep(2000)
        let strJson = inspector.getInspectorByKey('TextInput');
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0900 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0900 obj $attrs.showUnderline :' + JSON.stringify(obj.getElement('$attrs').getBoolean('showUnderline')));
        expect(obj.getElement('$attrs').getBoolean('showUnderline')).assertEqual(false);
        done()
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_ShowError_static_0100
     * @tc.name     ArkUX_Stage_TextInput_ShowError_static_0100
     * @tc.desc     ArkUX_Stage_TextInput_ShowError_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_ShowError_static_0100', Level.LEVEL1, async (done: ()=>void) => {
      await forKey("TextStr", "string");
        let strJson = inspector.getInspectorByKey('TextInput');
        console.info('ArkUX_Stage_TextInput_ShowError_0100 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextInput_ShowError_0100 obj $attrs.showError :' + JSON.stringify(obj.getElement('$attrs').getString('showError')));
        console.info('ArkUX_Stage_TextInput_ShowError_0100 obj $attrs.showErrorText :' + JSON.stringify(obj.getElement('$attrs').getBoolean('showErrorText')));
        console.info('ArkUX_Stage_TextInput_ShowError_0100 obj $attrs.errorText :' + JSON.stringify(obj.getElement('$attrs').getString('errorText')));

        expect(obj.getElement('$attrs').getBoolean('showErrorText')).assertEqual(true);
        expect(obj.getElement('$attrs').getString('errorText')).assertEqual('string');
        expect(obj.getElement('$attrs').getString('showError')).assertEqual('string');

        done()
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_ShowError_static_0200
     * @tc.name     ArkUX_Stage_TextInput_ShowError_static_0200
     * @tc.desc     ArkUX_Stage_TextInput_ShowError_static_0200
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_ShowError_static_0200', Level.LEVEL1, async (done: ()=>void) => {
      await forKey("TextErr", "undefined");
        let strJson = inspector.getInspectorByKey('TextInput');
        console.info('ArkUX_Stage_TextInput_ShowError_0200 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextInput_ShowError_0200 obj $attrs.showError :' + JSON.stringify(obj.getElement('$attrs').getString('showError')));
        console.info('ArkUX_Stage_TextInput_ShowError_0200 obj $attrs.showErrorText :' + JSON.stringify(obj.getElement('$attrs').getBoolean('showErrorText')));
        console.info('ArkUX_Stage_TextInput_ShowError_0200 obj $attrs.errorText :' + JSON.stringify(obj.getElement('$attrs').getString('errorText')));

        expect(obj.getElement('$attrs').getBoolean('showErrorText')).assertEqual(false);
        expect(obj.getElement('$attrs').getString('errorText')).assertEqual('');
        expect(obj.getElement('$attrs').getString('showError')).assertEqual('undefined');
        done()
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_ShowError_static_0300
     * @tc.name     ArkUX_Stage_TextInput_ShowError_static_0300
     * @tc.desc     ArkUX_Stage_TextInput_ShowError_static_0300
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_ShowError_static_0300', Level.LEVEL1, async (done: ()=>void) => {
      await forKey("TextNum", "10");
        let strJson = inspector.getInspectorByKey('TextInput');
        console.info('ArkUX_Stage_TextInput_ShowError_0300 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextInput_ShowError_0300 obj $attrs.showError :' + JSON.stringify(obj.getElement('$attrs').getString('showError')));
        console.info('ArkUX_Stage_TextInput_ShowError_0300 obj $attrs.showErrorText :' + JSON.stringify(obj.getElement('$attrs').getBoolean('showErrorText')));
        console.info('ArkUX_Stage_TextInput_ShowError_0300 obj $attrs.errorText :' + JSON.stringify(obj.getElement('$attrs').getString('errorText')));

        expect(obj.getElement('$attrs').getBoolean('showErrorText')).assertEqual(false);
        expect(obj.getElement('$attrs').getString('errorText')).assertEqual('');
        expect(obj.getElement('$attrs').getString('showError')).assertEqual('undefined');
        done()
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_ShowError_static_0400
     * @tc.name     ArkUX_Stage_TextInput_ShowError_static_0400
     * @tc.desc     ArkUX_Stage_TextInput_ShowError_static_0400
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_ShowError_static_0400', Level.LEVEL1, async (done: ()=>void) => {
        let strJson = inspector.getInspectorByKey('TextInputResources');
        console.info('ArkUX_Stage_TextInput_ShowError_0400 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextInput_ShowError_0400 obj $attrs.showError :' + JSON.stringify(obj.getElement('$attrs').getString('showError')));
        console.info('ArkUX_Stage_TextInput_ShowError_0400 obj $attrs.showErrorText :' + JSON.stringify(obj.getElement('$attrs').getBoolean('showErrorText')));
        console.info('ArkUX_Stage_TextInput_ShowError_0400 obj $attrs.errorText :' + JSON.stringify(obj.getElement('$attrs').getString('errorText')));

        expect(obj.getElement('$attrs').getBoolean('showErrorText')).assertEqual(true);
        expect(obj.getElement('$attrs').getString('errorText')).assertEqual('string');
        expect(obj.getElement('$attrs').getString('showError')).assertEqual('string');
        done()
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_ShowError_static_0500
     * @tc.name     ArkUX_Stage_TextInput_ShowError_static_0500
     * @tc.desc     ArkUX_Stage_TextInput_ShowError_static_0500
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_ShowError_static_0500', Level.LEVEL1, async (done: ()=>void) => {
      await forKey("TextStr", '');
        let strJson = inspector.getInspectorByKey('TextInput');
        console.info('ArkUX_Stage_TextInput_ShowError_0500 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0500 obj $attrs.showError :' + JSON.stringify(obj.getElement('$attrs').getString('showError')));
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0500 obj $attrs.showErrorText :' + JSON.stringify(obj.getElement('$attrs').getBoolean('showErrorText')));
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0500 obj $attrs.errorText :' + JSON.stringify(obj.getElement('$attrs').getString('errorText')));

        expect(obj.getElement('$attrs').getBoolean('showErrorText')).assertEqual(true);
        expect(obj.getElement('$attrs').getString('errorText')).assertEqual('');
        expect(obj.getElement('$attrs').getString('showError')).assertEqual('');
        done()
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_ShowError_static_0600
     * @tc.name     ArkUX_Stage_TextInput_ShowError_static_0600
     * @tc.desc     ArkUX_Stage_TextInput_ShowError_static_0600
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_ShowError_static_0600', Level.LEVEL1, async (done: ()=>void) => {
      await forKey("TextErr", "null");
        let strJson = inspector.getInspectorByKey('TextInput');
        console.info('ArkUX_Stage_TextInput_ShowError_0600 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextInput_ShowError_0600 obj $attrs.showError :' + JSON.stringify(obj.getElement('$attrs').getString('showError')));
        console.info('ArkUX_Stage_TextInput_ShowError_0600 obj $attrs.showErrorText :' + JSON.stringify(obj.getElement('$attrs').getBoolean('showErrorText')));
        console.info('ArkUX_Stage_TextInput_ShowError_0600 obj $attrs.errorText :' + JSON.stringify(obj.getElement('$attrs').getString('errorText')));

        expect(obj.getElement('$attrs').getBoolean('showErrorText')).assertEqual(false);
        expect(obj.getElement('$attrs').getString('errorText')).assertEqual('');
        expect(obj.getElement('$attrs').getString('showError')).assertEqual('undefined');
        done()
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_ShowError_static_0700
     * @tc.name     ArkUX_Stage_TextInput_ShowError_static_0700
     * @tc.desc     ArkUX_Stage_TextInput_ShowError_static_0700
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_ShowError_static_0700', Level.LEVEL1, async (done: ()=>void) => {
      await forKey("TextNum", "-1");
        let strJson = inspector.getInspectorByKey('TextInput');
        console.info('ArkUX_Stage_TextInput_ShowError_0700 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextInput_ShowError_0700 obj $attrs.showError :' + JSON.stringify(obj.getElement('$attrs').getString('showError')));
        console.info('ArkUX_Stage_TextInput_ShowError_0700 obj $attrs.showErrorText :' + JSON.stringify(obj.getElement('$attrs').getBoolean('showErrorText')));
        console.info('ArkUX_Stage_TextInput_ShowError_0700 obj $attrs.errorText :' + JSON.stringify(obj.getElement('$attrs').getString('errorText')));

        expect(obj.getElement('$attrs').getBoolean('showErrorText')).assertEqual(false);
        expect(obj.getElement('$attrs').getString('errorText')).assertEqual('');
        expect(obj.getElement('$attrs').getString('showError')).assertEqual('undefined');
        done()
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_ShowError_static_0800
     * @tc.name     ArkUX_Stage_TextInput_ShowError_static_0800
     * @tc.desc     ArkUX_Stage_TextInput_ShowError_static_0800
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_ShowError_static_0800', Level.LEVEL1, async (done: ()=>void) => {
      await forKey("TextStr", "string");
      await forKey("TextStr", "showError");
        let strJson = inspector.getInspectorByKey('TextInput');
        console.info('ArkUX_Stage_TextInput_ShowError_0800 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextInput_ShowError_0800 obj $attrs.showError :' + JSON.stringify(obj.getElement('$attrs').getString('showError')));
        console.info('ArkUX_Stage_TextInput_ShowError_0800 obj $attrs.showErrorText :' + JSON.stringify(obj.getElement('$attrs').getBoolean('showErrorText')));
        console.info('ArkUX_Stage_TextInput_ShowError_0800 obj $attrs.errorText :' + JSON.stringify(obj.getElement('$attrs').getString('errorText')));

        expect(obj.getElement('$attrs').getBoolean('showErrorText')).assertEqual(true);
        expect(obj.getElement('$attrs').getString('errorText')).assertEqual('showError');
        expect(obj.getElement('$attrs').getString('showError')).assertEqual('showError');
        done()
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_ShowError_static_0900
     * @tc.name     ArkUX_Stage_TextInput_ShowError_static_0900
     * @tc.desc     ArkUX_Stage_TextInput_ShowError_static_0900
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_ShowError_static_0900', Level.LEVEL1, async (done: ()=>void) => {
      await forKey("TextStr", "string");
      await forKey("TextErr", "null");
        let strJson = inspector.getInspectorByKey('TextInput');
        console.info('ArkUX_Stage_TextInput_ShowError_0900 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextInput_ShowError_0900 obj $attrs.showError :' + JSON.stringify(obj.getElement('$attrs').getString('showError')));
        console.info('ArkUX_Stage_TextInput_ShowError_0900 obj $attrs.showErrorText :' + JSON.stringify(obj.getElement('$attrs').getBoolean('showErrorText')));
        console.info('ArkUX_Stage_TextInput_ShowError_0900 obj $attrs.errorText :' + JSON.stringify(obj.getElement('$attrs').getString('errorText')));

        expect(obj.getElement('$attrs').getBoolean('showErrorText')).assertEqual(false);
        expect(obj.getElement('$attrs').getString('errorText')).assertEqual('');
        expect(obj.getElement('$attrs').getString('showError')).assertEqual('undefined');
        done()
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_ShowError_static_1000
     * @tc.name     ArkUX_Stage_TextInput_ShowError_static_1000
     * @tc.desc     ArkUX_Stage_TextInput_ShowError_static_1000
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_ShowError_static_1000', Level.LEVEL1, async (done: ()=>void) => {
      await forKey("TextErr", "null");
      await forKey("TextStr", "string");
        let strJson = inspector.getInspectorByKey('TextInput');
        console.info('ArkUX_Stage_TextInput_ShowError_1000 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextInput_ShowError_1000 obj $attrs.showError :' + JSON.stringify(obj.getElement('$attrs').getString('showError')));
        console.info('ArkUX_Stage_TextInput_ShowError_1000 obj $attrs.showErrorText :' + JSON.stringify(obj.getElement('$attrs').getBoolean('showErrorText')));
        console.info('ArkUX_Stage_TextInput_ShowError_1000 obj $attrs.errorText :' + JSON.stringify(obj.getElement('$attrs').getString('errorText')));

        expect(obj.getElement('$attrs').getBoolean('showErrorText')).assertEqual(true);
        expect(obj.getElement('$attrs').getString('errorText')).assertEqual('string');
        expect(obj.getElement('$attrs').getString('showError')).assertEqual('string');
        done()
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_PasswordIcon_static_0100
     * @tc.name     ArkUX_Stage_TextInput_PasswordIcon_static_0100
     * @tc.desc     ArkUX_Stage_TextInput_PasswordIcon_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_PasswordIcon_static_0100', Level.LEVEL1, async (done: ()=>void) => {
      let passwordIcon: PasswordIcon = {
        onIconSrc: $r("app.media.ohos_app_bar_fa"),
      }
      await forKey("passWordIcon", "", passwordIcon);
        let obj = JSON.parseJsonElement(inspector.getInspectorByKey('TextInput'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0100 obj $attrs.passwordIcon :' + JSON.stringify(obj.getElement('$attrs').getString('passwordIcon')));
        let Icon = JSON.parseJsonElement(obj.getElement('$attrs').getString('passwordIcon'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0100 obj Icon :' + JSON.stringify(Icon));
        expect((Icon.getElement('onIconSrc').asString().indexOf($r("app.media.ohos_app_bar_fa").id.toString() + ".svg")) != -1).assertTrue();
        expect(Icon.getString('offIconSrc')).assertEqual("SYS_HIDE_PASSWORD_SVG");
        done()
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_PasswordIcon_static_0200
     * @tc.name     ArkUX_Stage_TextInput_PasswordIcon_static_0200
     * @tc.desc     ArkUX_Stage_TextInput_PasswordIcon_static_0200
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_PasswordIcon_static_0200', Level.LEVEL1, async (done: ()=>void) => {
      let passwordIcon: PasswordIcon = {
        offIconSrc: $r("app.media.ohos_app_bar_back"),
      }
      await forKey("passWordIcon", "", passwordIcon);
        let obj = JSON.parseJsonElement(inspector.getInspectorByKey('TextInput'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0200 obj $attrs.passwordIcon :' + JSON.stringify(obj.getElement('$attrs').getString('passwordIcon')));
        let Icon = JSON.parseJsonElement(obj.getElement('$attrs').getString('passwordIcon'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0200 obj Icon :' + JSON.stringify(Icon));
        expect(Icon.getString('onIconSrc')).assertEqual("SYS_SHOW_PASSWORD_SVG");
        expect((Icon.getElement('offIconSrc').asString().indexOf($r("app.media.ohos_app_bar_back").id.toString() + ".svg")) != -1).assertTrue();
        done()
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_PasswordIcon_static_0300
     * @tc.name     ArkUX_Stage_TextInput_PasswordIcon_static_0300
     * @tc.desc     ArkUX_Stage_TextInput_PasswordIcon_static_0300
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_PasswordIcon_static_0300', Level.LEVEL1, async (done: ()=>void) => {
      let passwordIcon: PasswordIcon = {
        onIconSrc: $r("app.media.ohos_correct"),
        offIconSrc: $r("app.media.ohos_close"),
      }
      await forKey("passWordIcon", "", passwordIcon);
        let obj = JSON.parseJsonElement(inspector.getInspectorByKey('TextInput'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0300 obj $attrs.passwordIcon :' + JSON.stringify(obj.getElement('$attrs').getString('passwordIcon')));
        let Icon = JSON.parseJsonElement(obj.getElement('$attrs').getString('passwordIcon'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0300 obj Icon :' + JSON.stringify(Icon));
        expect((Icon.getElement('onIconSrc').asString().indexOf($r("app.media.ohos_correct").id.toString() + ".svg")) != -1).assertTrue();
        expect((Icon.getElement('offIconSrc').asString().indexOf($r("app.media.ohos_close").id.toString() + ".svg")) != -1).assertTrue();
        done()
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_PasswordIcon_static_0400
     * @tc.name     ArkUX_Stage_TextInput_PasswordIcon_static_0400
     * @tc.desc     ArkUX_Stage_TextInput_PasswordIcon_static_0400
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_PasswordIcon_static_0400', Level.LEVEL1, async (done: ()=>void) => {
      let passwordIcon: PasswordIcon = {
        onIconSrc: undefined,
        offIconSrc: undefined,
      }
      await forKey("passWordIcon", "", passwordIcon);
        let obj = JSON.parseJsonElement(inspector.getInspectorByKey('TextInput'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0400 obj $attrs.passwordIcon :' + JSON.stringify(obj.getElement('$attrs').getString('passwordIcon')));
        let Icon = JSON.parseJsonElement(obj.getElement('$attrs').getString('passwordIcon'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0400 obj Icon :' + JSON.stringify(Icon));
        expect(Icon.getString('onIconSrc')).assertEqual("SYS_SHOW_PASSWORD_SVG");
        expect(Icon.getString('offIconSrc')).assertEqual("SYS_HIDE_PASSWORD_SVG");

        done()
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_PasswordIcon_static_0500
     * @tc.name     ArkUX_Stage_TextInput_PasswordIcon_static_0500
     * @tc.desc     ArkUX_Stage_TextInput_PasswordIcon_static_0500
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_PasswordIcon_static_0500', Level.LEVEL1, async (done: ()=>void) => {
      let passwordIcon: PasswordIcon = {
        onIconSrc: undefined,
        offIconSrc: undefined,
      }
      await forKey("passWordIcon", "", passwordIcon);
        let obj = JSON.parseJsonElement(inspector.getInspectorByKey('TextInput'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0500 obj $attrs.passwordIcon :' + JSON.stringify(obj.getElement('$attrs').getString('passwordIcon')));
        let Icon = JSON.parseJsonElement(obj.getElement('$attrs').getString('passwordIcon'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0500 obj Icon :' + JSON.stringify(Icon));
        expect(Icon.getString('onIconSrc')).assertEqual("SYS_SHOW_PASSWORD_SVG");
        expect(Icon.getString('offIconSrc')).assertEqual("SYS_HIDE_PASSWORD_SVG");
        done()
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_PasswordIcon_static_0600
     * @tc.name     ArkUX_Stage_TextInput_PasswordIcon_static_0600
     * @tc.desc     ArkUX_Stage_TextInput_PasswordIcon_static_0600
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_PasswordIcon_static_0600', Level.LEVEL1, async (done: ()=>void) => {
      let passwordIcon: PasswordIcon = {
        onIconSrc: "",
        offIconSrc: "",
      }
      await forKey("passWordIcon", "", passwordIcon);
        let obj = JSON.parseJsonElement(inspector.getInspectorByKey('TextInput'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0600 obj $attrs.passwordIcon :' + JSON.stringify(obj.getElement('$attrs').getString('passwordIcon')));
        let Icon = JSON.parseJsonElement(obj.getElement('$attrs').getString('passwordIcon'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0600 obj Icon :' + JSON.stringify(Icon));
        expect(Icon.getString('onIconSrc')).assertEqual("SYS_SHOW_PASSWORD_SVG");
        expect(Icon.getString('offIconSrc')).assertEqual("SYS_HIDE_PASSWORD_SVG");
        done()
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_PasswordIcon_static_0700
     * @tc.name     ArkUX_Stage_TextInput_PasswordIcon_static_0700
     * @tc.desc     ArkUX_Stage_TextInput_PasswordIcon_static_0700
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_PasswordIcon_static_0700', Level.LEVEL1, async (done: ()=>void) => {
      let passwordIcon: PasswordIcon = {
        onIconSrc: undefined,
        offIconSrc: undefined,
      }
      await forKey("passWordIcon", "", passwordIcon);
        let obj = JSON.parseJsonElement(inspector.getInspectorByKey('TextInput'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0700 obj $attrs.passwordIcon :' + JSON.stringify(obj.getElement('$attrs').getString('passwordIcon')));
        let Icon = JSON.parseJsonElement(obj.getElement('$attrs').getString('passwordIcon'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0700 obj Icon :' + JSON.stringify(Icon));
        expect(Icon.getString('onIconSrc')).assertEqual("SYS_SHOW_PASSWORD_SVG");
        expect(Icon.getString('offIconSrc')).assertEqual("SYS_HIDE_PASSWORD_SVG");
        done()
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_PasswordIcon_static_0800
     * @tc.name     ArkUX_Stage_TextInput_PasswordIcon_static_0800
     * @tc.desc     ArkUX_Stage_TextInput_PasswordIcon_static_0800
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_PasswordIcon_static_0800', Level.LEVEL1, async (done: ()=>void) => {
      let passwordIcon: PasswordIcon = {
        onIconSrc: $r('app.media.ohos_correct'),
        offIconSrc: undefined
      }
      await forKey("passWordIcon", "", passwordIcon);
        let obj = JSON.parseJsonElement(inspector.getInspectorByKey('TextInput'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0800 obj $attrs.passwordIcon :' + JSON.stringify(obj.getElement('$attrs').getString('passwordIcon')));
        let Icon = JSON.parseJsonElement(obj.getElement('$attrs').getString('passwordIcon'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0800 obj Icon :' + JSON.stringify(Icon));
        expect((Icon.getElement('onIconSrc').asString().indexOf($r("app.media.ohos_correct").id.toString() + ".svg")) != -1).assertTrue();
        expect(Icon.getString('offIconSrc')).assertEqual("SYS_HIDE_PASSWORD_SVG");
        done()
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_PasswordIcon_static_0900
     * @tc.name     ArkUX_Stage_TextInput_PasswordIcon_static_0900
     * @tc.desc     ArkUX_Stage_TextInput_PasswordIcon_static_0900
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_PasswordIcon_static_0900', Level.LEVEL1, async (done: ()=>void) => {
      let passwordIcon: PasswordIcon = {
        onIconSrc: undefined, offIconSrc: $r('app.media.ohos_close')
      }
      await forKey("passWordIcon", "", passwordIcon);
        let obj = JSON.parseJsonElement(inspector.getInspectorByKey('TextInput'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0900 obj $attrs.passwordIcon :' + JSON.stringify(obj.getElement('$attrs').getString('passwordIcon')));
        let Icon = JSON.parseJsonElement(obj.getElement('$attrs').getString('passwordIcon'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0900 obj Icon :' + JSON.stringify(Icon));
        expect(Icon.getString('onIconSrc')).assertEqual("SYS_SHOW_PASSWORD_SVG");
        expect((Icon.getString('offIconSrc').indexOf($r("app.media.ohos_close").id.toString() + ".svg")) != -1).assertTrue();

        done()
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_PasswordIcon_static_1000
     * @tc.name     ArkUX_Stage_TextInput_PasswordIcon_static_1000
     * @tc.desc     ArkUX_Stage_TextInput_PasswordIcon_static_1000
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_PasswordIcon_static_1000', Level.LEVEL1, async (done: ()=>void) => {
      let passwordIcon: PasswordIcon = {
        onIconSrc: $r('app.media.ohos_correct'), offIconSrc: $r('app.media.ohos_close')
      }
      await forKey("passWordIcon", "", passwordIcon);
      passwordIcon = {
        onIconSrc: $r('app.media.ohos_app_bar_fa'), offIconSrc: $r('app.media.ohos_app_bar_back')
      }
      await forKey("passWordIcon", "", passwordIcon);
      await UtilsTest.msSleep(1000)
        let obj = JSON.parseJsonElement(inspector.getInspectorByKey('TextInput'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1000 obj $attrs.passwordIcon :' + JSON.stringify(obj.getElement('$attrs').getString('passwordIcon')));
        let Icon = JSON.parseJsonElement(obj.getElement('$attrs').getString('passwordIcon'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1000 obj Icon :' + JSON.stringify(Icon));
        expect((Icon.getElement('onIconSrc').asString().indexOf($r("app.media.ohos_app_bar_fa").id.toString() + ".svg")) != -1).assertTrue();
        expect((Icon.getElement('offIconSrc').asString().indexOf($r("app.media.ohos_app_bar_back").id.toString() + ".svg")) != -1).assertTrue();
        done()
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_PasswordIcon_static_1100
     * @tc.name     ArkUX_Stage_TextInput_PasswordIcon_static_1100
     * @tc.desc     ArkUX_Stage_TextInput_PasswordIcon_static_1100
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_PasswordIcon_static_1100', Level.LEVEL1, async (done: ()=>void) => {
      let passwordIcon: PasswordIcon = {
        onIconSrc: $r('app.media.ohos_correct'), offIconSrc: $r('app.media.ohos_close')
      }
      await forKey("passWordIcon", "", passwordIcon);
      passwordIcon = {
        onIconSrc: undefined, offIconSrc: undefined
      }
      await forKey("passWordIcon", "", passwordIcon);
        let obj = JSON.parseJsonElement(inspector.getInspectorByKey('TextInput'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1100 obj $attrs.passwordIcon :' + JSON.stringify(obj.getElement('$attrs').getString('passwordIcon')));
        let Icon = JSON.parseJsonElement(obj.getElement('$attrs').getString('passwordIcon'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1100 obj Icon :' + JSON.stringify(Icon));
        expect(Icon.getString('onIconSrc')).assertEqual("SYS_SHOW_PASSWORD_SVG");
        expect(Icon.getString('offIconSrc')).assertEqual("SYS_HIDE_PASSWORD_SVG");
        done()
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_PasswordIcon_static_1200
     * @tc.name     ArkUX_Stage_TextInput_PasswordIcon_static_1200
     * @tc.desc     ArkUX_Stage_TextInput_PasswordIcon_static_1200
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_PasswordIcon_static_1200', Level.LEVEL1, async (done: ()=>void) => {
      let passwordIcon: PasswordIcon = {
        onIconSrc: undefined, offIconSrc: undefined
      }
      await forKey("passWordIcon", "", passwordIcon);
      passwordIcon = {
        onIconSrc: $r('app.media.ohos_correct'), offIconSrc: $r('app.media.ohos_close')
      }
      await forKey("passWordIcon", "", passwordIcon);
        let obj = JSON.parseJsonElement(inspector.getInspectorByKey('TextInput'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1200 obj $attrs.passwordIcon :' + JSON.stringify(obj.getElement('$attrs').getString('passwordIcon')));
        let Icon = JSON.parseJsonElement(obj.getElement('$attrs').getString('passwordIcon'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1200 obj Icon :' + JSON.stringify(Icon));
        expect((Icon.getElement('onIconSrc').asString().indexOf($r("app.media.ohos_correct").id.toString() + ".svg")) != -1).assertTrue();
        expect((Icon.getElement('offIconSrc').asString().indexOf($r("app.media.ohos_close").id.toString() + ".svg")) != -1).assertTrue();
        done()
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_PasswordIcon_static_1300
     * @tc.name     ArkUX_Stage_TextInput_PasswordIcon_static_1300
     * @tc.desc     ArkUX_Stage_TextInput_PasswordIcon_static_1300
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_PasswordIcon_static_1300', Level.LEVEL1, async (done: ()=>void) => {
      let passwordIcon: PasswordIcon = {
        onIconSrc: $r('app.media.ohos_correct'), offIconSrc: undefined
      }
      await forKey("passWordIcon", "", passwordIcon);
      passwordIcon = {
        onIconSrc: undefined, offIconSrc: $r('app.media.ohos_app_bar_back')
      }
      await forKey("passWordIcon", "", passwordIcon);
        let obj = JSON.parseJsonElement(inspector.getInspectorByKey('TextInput'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1200 obj $attrs.passwordIcon :' + JSON.stringify(obj.getElement('$attrs').getString('passwordIcon')));
        let Icon = JSON.parseJsonElement(obj.getElement('$attrs').getString('passwordIcon'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1200 obj Icon :' + JSON.stringify(Icon));
        expect(Icon.getString('onIconSrc')).assertEqual("SYS_SHOW_PASSWORD_SVG");
        expect((Icon.getString('offIconSrc').indexOf($r("app.media.ohos_app_bar_back").id.toString() + ".svg")) != -1).assertTrue();
        done()
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_PasswordIcon_static_1400
     * @tc.name     ArkUX_Stage_TextInput_PasswordIcon_static_1400
     * @tc.desc     ArkUX_Stage_TextInput_PasswordIcon_static_1400
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_PasswordIcon_static_1400', Level.LEVEL1, async (done: ()=>void) => {
      let passwordIcon: PasswordIcon = {
        onIconSrc: $r('app.media.ohos_correct'), offIconSrc: $r('app.media.ohos_close')
      }
      await forKey("passWordIcon", "", passwordIcon);
      let passwordIconSec: PasswordIcon = {
        onIconSrc: undefined
      }
      await forKey("passWordIcon", "", passwordIconSec);
        let obj = JSON.parseJsonElement(inspector.getInspectorByKey('TextInput'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1400 obj $attrs.passwordIcon :' + JSON.stringify(obj.getElement('$attrs').getString('passwordIcon')));
        let Icon = JSON.parseJsonElement(obj.getElement('$attrs').getString('passwordIcon'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1400 obj Icon :' + JSON.stringify(Icon));
        expect(Icon.getString('onIconSrc')).assertEqual("SYS_SHOW_PASSWORD_SVG");
        expect(Icon.getString('offIconSrc')).assertEqual("SYS_HIDE_PASSWORD_SVG");
        done()
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_PasswordIcon_static_1500
     * @tc.name     ArkUX_Stage_TextInput_PasswordIcon_static_1500
     * @tc.desc     ArkUX_Stage_TextInput_PasswordIcon_static_1500
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_PasswordIcon_static_1500', Level.LEVEL1, async (done: ()=>void) => {
        let obj = JSON.parseJsonElement(inspector.getInspectorByKey('TextInputNO'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1500 obj $attrs.passwordIcon :' + JSON.stringify(obj.getElement('$attrs').getString('passwordIcon')));
        let Icon = JSON.parseJsonElement(obj.getElement('$attrs').getString('passwordIcon'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1500 obj Icon :' + JSON.stringify(Icon));
        expect(Icon.getDouble('onIconSrc')).assertEqual(983328);
        expect(Icon.getDouble('offIconSrc')).assertEqual(983327);
        expect(obj.getElement('$attrs').getBoolean('showErrorText')).assertEqual(false);
        expect(obj.getElement('$attrs').getString('errorText')).assertEqual('');
        expect(obj.getElement('$attrs').getString('showError')).assertEqual('undefined');
        expect(obj.getElement('$attrs').getBoolean('showUnderline')).assertEqual(false);
        
        done()
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_PasswordIcon_static_1600
     * @tc.name     ArkUX_Stage_TextInput_PasswordIcon_static_1600
     * @tc.desc     ArkUX_Stage_TextInput_PasswordIcon_static_1600
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_PasswordIcon_static_1600', Level.LEVEL1, async (done: ()=>void) => {
      let passwordIcon: PasswordIcon = {
        onIconSrc: $r('app.media.icon'), offIconSrc: $r('app.media.icon')
      }
      await forKey("passWordIcon", "", passwordIcon);
        let obj = JSON.parseJsonElement(inspector.getInspectorByKey('TextInput'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1600 obj $attrs.passwordIcon :' + JSON.stringify(obj.getElement('$attrs').getString('passwordIcon')));
        let Icon = JSON.parseJsonElement(obj.getElement('$attrs').getString('passwordIcon'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1600 obj Icon :' + JSON.stringify(Icon));
        expect((Icon.getElement('onIconSrc').asString().indexOf($r("app.media.icon").id.toString() + ".png")) != -1).assertTrue();
        expect((Icon.getElement('offIconSrc').asString().indexOf($r("app.media.icon").id.toString() + ".png")) != -1).assertTrue();

        done()
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_PasswordIcon_static_1700
     * @tc.name     ArkUX_Stage_TextInput_PasswordIcon_static_1700
     * @tc.desc     ArkUX_Stage_TextInput_PasswordIcon_static_1700
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_PasswordIcon_static_1700', Level.LEVEL1, async (done: ()=>void) => {
      let passwordIcon: PasswordIcon = {
        onIconSrc: "../../resources/base/media/icon.png", offIconSrc: "../../resources/base/media/icon.png"
      }
      await forKey("passWordIcon", "", passwordIcon);
        let obj = JSON.parseJsonElement(inspector.getInspectorByKey('TextInput'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1700 obj $attrs.passwordIcon :' + JSON.stringify(obj.getElement('$attrs').getString('passwordIcon')));
        let Icon = JSON.parseJsonElement(obj.getElement('$attrs').getString('passwordIcon'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1700 obj Icon :' + JSON.stringify(Icon));
        expect(Icon.getString('onIconSrc')).assertEqual("../../resources/base/media/icon.png");
        expect(Icon.getString('offIconSrc')).assertEqual("../../resources/base/media/icon.png");
        done()
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_barState_static_0100
     * @tc.name     ArkUX_Stage_TextInput_barState_static_0100
     * @tc.desc     ArkUX_Stage_TextInput_barState_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_barState_static_0100', Level.LEVEL1, (done: ()=>void) :void => {
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_barState_0100');
          let obj = JSON.parseJsonElement(strJson);
          console.info('ArkUX_Stage_TextInput_barState_0100 barState:' + JSON.stringify(obj.getElement('$attrs').getString('barState')));
          expect(obj.getElement('$attrs').getString('barState')).assertEqual('BarState.OFF');
        done()
      }, 500);
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_barState_static_0200
     * @tc.name     ArkUX_Stage_TextInput_barState_static_0200
     * @tc.desc     ArkUX_Stage_TextInput_barState_static_0200
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_barState_static_0200', Level.LEVEL1, (done: ()=>void)  :void=> {
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_barState_0200');
          let obj = JSON.parseJsonElement(strJson);
          console.info('ArkUX_Stage_TextInput_barState_0200 barState:' + JSON.stringify(obj.getElement('$attrs').getString('barState')));
          expect(obj.getElement('$attrs').getString('barState')).assertEqual('BarState.AUTO');
        done()
      }, 500);
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_barState_static_0300
     * @tc.name     ArkUX_Stage_TextInput_barState_static_0300
     * @tc.desc     ArkUX_Stage_TextInput_barState_static_0300
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_barState_static_0300', Level.LEVEL1, (done: ()=>void) :void => {
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_barState_0300');
          let obj = JSON.parseJsonElement(strJson);
          console.info('ArkUX_Stage_TextInput_barState_0300 barState:' + JSON.stringify(obj.getElement('$attrs').getString('barState')));
          expect(obj.getElement('$attrs').getString('barState')).assertEqual('BarState.ON');
        done()
      }, 500);
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_barState_static_0400
     * @tc.name     ArkUX_Stage_TextInput_barState_static_0400
     * @tc.desc     ArkUX_Stage_TextInput_barState_static_0400
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_barState_static_0400', Level.LEVEL1, (done: ()=>void) :void => {
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_barState_0400');
          let obj = JSON.parseJsonElement(strJson);
          console.info('ArkUX_Stage_TextInput_barState_0400 barState:' + JSON.stringify(obj.getElement('$attrs').getString('barState')));
          expect(obj.getElement('$attrs').getString('barState')).assertEqual('BarState.AUTO');
        done()
      }, 500);
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_barState_static_0500
     * @tc.name     ArkUX_Stage_TextInput_barState_static_0500
     * @tc.desc     ArkUX_Stage_TextInput_barState_static_0500
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_barState_static_0500', Level.LEVEL1, (done: ()=>void) :void => {
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_barState_0500');
          let obj = JSON.parseJsonElement(strJson);
          console.info('ArkUX_Stage_TextInput_barState_0500 barState:' + JSON.stringify(obj.getElement('$attrs').getString('barState')));
          expect(obj.getElement('$attrs').getString('barState')).assertEqual('BarState.OFF');
        done()
      }, 500);
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_barState_static_0600
     * @tc.name     ArkUX_Stage_TextInput_barState_static_0600
     * @tc.desc     ArkUX_Stage_TextInput_barState_static_0600
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_barState_static_0600', Level.LEVEL1, (done: ()=>void) :void => {
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_barState_0600');
          let obj = JSON.parseJsonElement(strJson);
          console.info('ArkUX_Stage_TextInput_barState_0600 barState:' + JSON.stringify(obj.getElement('$attrs').getString('barState')));
          expect(obj.getElement('$attrs').getString('barState')).assertEqual('BarState.AUTO');
        done()
      }, 500);
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_barState_static_0700
     * @tc.name     ArkUX_Stage_TextInput_barState_static_0700
     * @tc.desc     ArkUX_Stage_TextInput_barState_static_0700
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_barState_static_0700', Level.LEVEL1, (done: ()=>void) :void => {
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_barState_0700');
          let obj = JSON.parseJsonElement(strJson);
          console.info('ArkUX_Stage_TextInput_barState_0700 barState:' + JSON.stringify(obj.getElement('$attrs').getString('barState')));
          expect(obj.getElement('$attrs').getString('barState')).assertEqual('BarState.AUTO');
        done()
      }, 500);
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_barState_static_0800
     * @tc.name     ArkUX_Stage_TextInput_barState_static_0800
     * @tc.desc     ArkUX_Stage_TextInput_barState_static_0800
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_barState_static_0800', Level.LEVEL1, (done: ()=>void) :void => {
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_barState_0800');
          let obj = JSON.parseJsonElement(strJson);
          console.info('ArkUX_Stage_TextInput_barState_0800 barState:' + JSON.stringify(obj.getElement('$attrs').getString('barState')));
          expect(obj.getElement('$attrs').getString('barState')).assertEqual('BarState.AUTO');
        done()
      }, 500);
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_barState_static_0900
     * @tc.name     ArkUX_Stage_TextInput_barState_static_0900
     * @tc.desc     ArkUX_Stage_TextInput_barState_static_0900
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_barState_static_0900', Level.LEVEL1, (done: ()=>void) :void => {
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_barState_0900');
          let obj = JSON.parseJsonElement(strJson);
          console.info('ArkUX_Stage_TextInput_barState_0900 barState:' + JSON.stringify(obj.getElement('$attrs').getString('barState')));
          expect(obj.getElement('$attrs').getString('barState')).assertEqual('BarState.AUTO');
        done()
      }, 500);
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_barState_static_1000
     * @tc.name     ArkUX_Stage_TextInput_barState_static_1000
     * @tc.desc     ArkUX_Stage_TextInput_barState_static_1000
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_barState_static_1000', Level.LEVEL1, (done: ()=>void) :void => {
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_barState_1000');
          let obj = JSON.parseJsonElement(strJson);
          console.info('ArkUX_Stage_TextInput_barState_1000 barState:' + JSON.stringify(obj.getElement('$attrs').getString('barState')));
          expect(obj.getElement('$attrs').getString('barState')).assertEqual('BarState.AUTO');
        done()
      }, 500);
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_barState_static_1100
     * @tc.name     ArkUX_Stage_TextInput_barState_static_1100
     * @tc.desc     ArkUX_Stage_TextInput_barState_static_1100
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_barState_static_1100', Level.LEVEL1, (done: ()=>void) :void => {
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_barState_1100');
          let obj = JSON.parseJsonElement(strJson);
          console.info('ArkUX_Stage_TextInput_barState_1100 barState:' + JSON.stringify(obj.getElement('$attrs').getString('barState')));
          expect(obj.getElement('$attrs').getString('barState')).assertEqual('BarState.AUTO');
        done()
      }, 500);
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_barState_static_1200
     * @tc.name     ArkUX_Stage_TextInput_barState_static_1200
     * @tc.desc     ArkUX_Stage_TextInput_barState_static_1200
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_barState_static_1200', Level.LEVEL1, (done: ()=>void) :void => {
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_barState_1200');
          let obj = JSON.parseJsonElement(strJson);
          console.info('ArkUX_Stage_TextInput_barState_1200 barState:' + JSON.stringify(obj.getElement('$attrs').getString('barState')));
          expect(obj.getElement('$attrs').getString('barState')).assertEqual('BarState.ON');
        done()
      }, 500);
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_barState_static_1300
     * @tc.name     ArkUX_Stage_TextInput_barState_static_1300
     * @tc.desc     ArkUX_Stage_TextInput_barState_static_1300
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_barState_static_1300', Level.LEVEL1, (done: ()=>void) :void => {
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('TextInputInlineNO');
          let obj = JSON.parseJsonElement(strJson);
          console.info('ArkUX_Stage_TextInput_barState_1300 barState:' + JSON.stringify(obj.getElement('$attrs').getString('barState')));
          expect(obj.getElement('$attrs').getString('barState')).assertEqual('BarState.AUTO');
        done()
      }, 500);
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_barState_static_1400
     * @tc.name     ArkUX_Stage_TextInput_barState_static_1400
     * @tc.desc     ArkUX_Stage_TextInput_barState_static_1400
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_barState_static_1400', Level.LEVEL1, (done: ()=>void) :void => {
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('TextInputStyleDefault');
          let obj = JSON.parseJsonElement(strJson);
          console.info('ArkUX_Stage_TextInput_barState_1400 barState:' + JSON.stringify(obj.getElement('$attrs').getString('barState')));
          expect(obj.getElement('$attrs').getString('barState')).assertEqual('BarState.ON');
        done()
      }, 500);
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_maxLines_static_0100
     * @tc.name     ArkUX_Stage_TextInput_maxLines_static_0100
     * @tc.desc     ArkUX_Stage_TextInput_maxLines_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_maxLines_static_0100', Level.LEVEL1, (done: ()=>void) :void => {
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_maxLines_0100');
          let obj = JSON.parseJsonElement(strJson);
          console.info('ArkUX_Stage_TextInput_maxLines_0100 maxLines:' + JSON.stringify(obj.getElement('$attrs').getString('maxLines')));
          expect(obj.getElement('$attrs').getString('maxLines')).assertEqual('10');
        done()
      }, 500);
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_maxLines_static_0200
     * @tc.name     ArkUX_Stage_TextInput_maxLines_static_0200
     * @tc.desc     ArkUX_Stage_TextInput_maxLines_static_0200
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_maxLines_static_0200', Level.LEVEL1, (done: ()=>void) :void => {
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_maxLines_0200');
          let obj = JSON.parseJsonElement(strJson);
          console.info('ArkUX_Stage_TextInput_maxLines_0200 maxLines:' + JSON.stringify(obj.getElement('$attrs').getString('maxLines')));
          expect(obj.getElement('$attrs').getString('maxLines')).assertEqual('3');
        done()
      }, 500);
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_maxLines_static_0300
     * @tc.name     ArkUX_Stage_TextInput_maxLines_static_0300
     * @tc.desc     ArkUX_Stage_TextInput_maxLines_static_0300
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_maxLines_static_0300', Level.LEVEL1, (done: ()=>void) :void => {
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_maxLines_0300');
          let obj = JSON.parseJsonElement(strJson);
          console.info('ArkUX_Stage_TextInput_maxLines_0300 maxLines:' + JSON.stringify(obj.getElement('$attrs').getString('maxLines')));
          expect(obj.getElement('$attrs').getString('maxLines')).assertEqual('3');
        done()
      }, 500);
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_maxLines_static_0400
     * @tc.name     ArkUX_Stage_TextInput_maxLines_static_0400
     * @tc.desc     ArkUX_Stage_TextInput_maxLines_static_0400
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_maxLines_static_0400', Level.LEVEL1, (done: ()=>void) :void => {
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_maxLines_0400');
          let obj = JSON.parseJsonElement(strJson);
          console.info('ArkUX_Stage_TextInput_maxLines_0400 maxLines:' + JSON.stringify(obj.getElement('$attrs').getString('maxLines')));
          expect(obj.getElement('$attrs').getString('maxLines')).assertEqual('3');
        done()
      }, 500);
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_maxLines_static_0500
     * @tc.name     ArkUX_Stage_TextInput_maxLines_static_0500
     * @tc.desc     ArkUX_Stage_TextInput_maxLines_static_0500
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_maxLines_static_0500', Level.LEVEL1, (done: ()=>void) :void => {
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_maxLines_0500');
          let obj = JSON.parseJsonElement(strJson);
          console.info('ArkUX_Stage_TextInput_maxLines_0500 maxLines:' + JSON.stringify(obj.getElement('$attrs').getString('maxLines')));
          expect(obj.getElement('$attrs').getString('maxLines')).assertEqual('3');
        done()
      }, 500);
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_maxLines_static_0600
     * @tc.name     ArkUX_Stage_TextInput_maxLines_static_0600
     * @tc.desc     ArkUX_Stage_TextInput_maxLines_static_0600
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_maxLines_static_0600', Level.LEVEL1, (done: ()=>void) :void => {
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_maxLines_0600');
          let obj = JSON.parseJsonElement(strJson);
          console.info('ArkUX_Stage_TextInput_maxLines_0600 maxLines:' + JSON.stringify(obj.getElement('$attrs').getString('maxLines')));
          expect(obj.getElement('$attrs').getString('maxLines')).assertEqual('3');
        done()
      }, 500);
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_maxLines_static_0700
     * @tc.name     ArkUX_Stage_TextInput_maxLines_static_0700
     * @tc.desc     ArkUX_Stage_TextInput_maxLines_static_0700
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_maxLines_static_0700', Level.LEVEL1, (done: ()=>void) :void => {
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_maxLines_0700');
          let obj = JSON.parseJsonElement(strJson);
          console.info('ArkUX_Stage_TextInput_maxLines_0700 maxLines:' + JSON.stringify(obj.getElement('$attrs').getString('maxLines')));
          expect(obj.getElement('$attrs').getString('maxLines')).assertEqual('3');
        done()
      }, 500);
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_maxLines_static_0800
     * @tc.name     ArkUX_Stage_TextInput_maxLines_static_0800
     * @tc.desc     ArkUX_Stage_TextInput_maxLines_static_0800
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_maxLines_static_0800', Level.LEVEL1, (done: ()=>void) :void => {
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_maxLines_0800');
          let obj = JSON.parseJsonElement(strJson);
          console.info('ArkUX_Stage_TextInput_maxLines_0800 maxLines:' + JSON.stringify(obj.getElement('$attrs').getString('maxLines')));
          expect(obj.getElement('$attrs').getString('maxLines')).assertEqual('10');
        done()
      }, 500);
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_maxLines_static_0900
     * @tc.name     ArkUX_Stage_TextInput_maxLines_static_0900
     * @tc.desc     ArkUX_Stage_TextInput_maxLines_static_0900
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_maxLines_static_0900', Level.LEVEL1, (done: ()=>void) :void => {
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_maxLines_0900');
          let obj = JSON.parseJsonElement(strJson);
          console.info('ArkUX_Stage_TextInput_maxLines_0900 maxLines:' + JSON.stringify(obj.getElement('$attrs').getString('maxLines')));
          expect(obj.getElement('$attrs').getString('maxLines')).assertEqual('3');
        done()
      }, 500);
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_maxLines_static_1000
     * @tc.name     ArkUX_Stage_TextInput_maxLines_static_1000
     * @tc.desc     ArkUX_Stage_TextInput_maxLines_static_1000
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_maxLines_static_1000', Level.LEVEL1, (done: ()=>void) :void => {
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_maxLines_1000');
          let obj = JSON.parseJsonElement(strJson);
          console.info('ArkUX_Stage_TextInput_maxLines_1000 maxLines:' + JSON.stringify(obj.getElement('$attrs').getString('maxLines')));
          expect(obj.getElement('$attrs').getString('maxLines')).assertEqual('10');
        done()
      }, 500);
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_maxLines_static_1100
     * @tc.name     ArkUX_Stage_TextInput_maxLines_static_1100
     * @tc.desc     ArkUX_Stage_TextInput_maxLines_static_1100
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_maxLines_static_1100', Level.LEVEL1, (done: ()=>void) :void => {
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('TextInputInlineNO');
          let obj = JSON.parseJsonElement(strJson);
          console.info('ArkUX_Stage_TextInput_maxLines_1100 maxLines:' + JSON.stringify(obj.getElement('$attrs').getString('maxLines')));
          expect(obj.getElement('$attrs').getString('maxLines')).assertEqual('3');
        done()
      }, 500);
    })

    /**
     * @tc.number   ArkUX_Stage_TextInput_maxLines_static_1200
     * @tc.name     ArkUX_Stage_TextInput_maxLines_static_1200
     * @tc.desc     ArkUX_Stage_TextInput_maxLines_static_1200
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextInput_maxLines_static_1200', Level.LEVEL1, (done: ()=>void) :void => {
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('TextInputStyleDefault');
          let obj = JSON.parseJsonElement(strJson);
          console.info('ArkUX_Stage_TextInput_maxLines_1200 maxLines:' + JSON.stringify(obj.getElement('$attrs').getString('maxLines')));
          expect(obj.getElement('$attrs').getString('maxLines')).assertEqual('1');
        done()
      }, 500);
    })
  })
}
