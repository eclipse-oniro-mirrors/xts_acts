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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { MessageManagerBase } from '../../../ets/MainAbility/common/MessageManager2';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

function sleep(time: number) {
  return new Promise<string>((resolve, reject) => {
    setTimeout(():void => {
      resolve("ok")
    }, time as Int)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}

async function forKey(Key: string, text: string) {
  try {
    AppStorage.get<MessageManagerBase<string>>("messageManagerTextAreaUx")?.notify({
      name: Key, value: text
    });
  } catch (err) {
    console.info("emit emitKey  err: " + JSON.stringify(err));
  }
  await sleep(2000)
}
const SUITE: string = 'textAreaUxTest'

export default function textAreaUxTest() {
  describe('textAreaUxTest', () => {

    beforeAll(() => {
      console.info("textAreaUxTest beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("textAreaUxTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextArea/textAreaux",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get textAreaUxTest state pages:" + JSON.stringify(pages));
        if (!("textAreaux" == pages.name)) {
          console.info("get textAreaUxTest pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push textAreaUxTest page error:" + err);
      }
      console.info("textAreaUxTest beforeEach end");
    });

    
    /**
     * @tc.number   ArkUX_Stage_TextArea_MaxLength_static_0100
     * @tc.name     ArkUX_Stage_TextArea_MaxLength_static_0100
     * @tc.desc     ArkUX_Stage_TextArea_MaxLength_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_TextArea_MaxLength_static_0100', Level.LEVEL1, async (done: ()=>void) => {
      await forKey("TextNum", "0");
      try {
        let strJson = inspector.getInspectorByKey('TextArea');
        console.info('ArkUX_Stage_TextArea_MaxLength_static_0100 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextArea_MaxLength_static_0100 obj $attrs.maxLength :' + JSON.stringify(obj.getElement('$attrs').getString('maxLength')));
        expect(obj.getElement('$attrs').getString('maxLength')).assertEqual("0")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextArea_MaxLength_static_0100 err  :' + JSON.stringify(err))
        done()
      }
    })

    
    /**
     * @tc.number   ArkUX_Stage_TextArea_MaxLength_static_0200
     * @tc.name     ArkUX_Stage_TextArea_MaxLength_static_0200
     * @tc.desc     ArkUX_Stage_TextArea_MaxLength_static_0200
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_TextArea_MaxLength_static_0200', Level.LEVEL1, async (done: ()=>void) => {
      await forKey("TextNum", "10");
      try {
        let strJson = inspector.getInspectorByKey('TextArea');
        console.info('ArkUX_Stage_TextArea_MaxLength_static_0200 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextArea_MaxLength_static_0200 obj $attrs.maxLength :' + JSON.stringify(obj.getElement('$attrs').getString('maxLength')));
        expect(obj.getElement('$attrs').getString('maxLength')).assertEqual("10")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextArea_MaxLength_static_0200 err  :' + JSON.stringify(err))
        done()
      }
    })

    // 异常值用例
    // /*
    //  * @tc.number   ArkUX_Stage_TextArea_MaxLength_static_0300
    //  * @tc.name     ArkUX_Stage_TextArea_MaxLength_static_0300
    //  * @tc.desc     ArkUX_Stage_TextArea_MaxLength_static_0300
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('ArkUX_Stage_TextArea_MaxLength_static_0300', Level.LEVEL1, async (done: ()=>void) => {
    //   await forKey("TextStr", "10");
    //   try {
    //     let strJson = inspector.getInspectorByKey('TextArea');
    //     console.info('ArkUX_Stage_TextArea_MaxLength_static_0300 START :' + JSON.stringify(strJson));
    //     let obj = JSON.parseJsonElement(strJson);
    //     console.info('ArkUX_Stage_TextArea_MaxLength_static_0300 obj $attrs.maxLength :' + JSON.stringify(obj.getElement('$attrs').getString('maxLength')));
    //     expect(obj.getElement('$attrs').getString('maxLength')).assertEqual("INF")
    //     done()
    //   } catch (err) {
    //     expect().assertFail()
    //     console.info('ArkUX_Stage_TextArea_MaxLength_static_0300 err  :' + JSON.stringify(err))
    //     done()
    //   }
    // })

    
    /**
     * @tc.number   ArkUX_Stage_TextArea_MaxLength_static_0400
     * @tc.name     ArkUX_Stage_TextArea_MaxLength_static_0400
     * @tc.desc     ArkUX_Stage_TextArea_MaxLength_static_0400
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_TextArea_MaxLength_static_0400', Level.LEVEL1, async (done: ()=>void) => {
      await forKey("TextNum", "-1");
      try {
        let strJson = inspector.getInspectorByKey('TextArea');
        console.info('ArkUX_Stage_TextArea_MaxLength_static_0400 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextArea_MaxLength_static_0400 obj $attrs.maxLength :' + JSON.stringify(obj.getElement('$attrs').getString('maxLength')));
        await sleep(5000)
        expect(obj.getElement('$attrs').getString('maxLength')).assertEqual("INF")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextArea_MaxLength_static_0400 err  :' + JSON.stringify(err))
        done()
      }
    })

    //  异常值用例
    // /*
    //  * @tc.number   ArkUX_Stage_TextArea_MaxLength_static_0500
    //  * @tc.name     ArkUX_Stage_TextArea_MaxLength_static_0500
    //  * @tc.desc     ArkUX_Stage_TextArea_MaxLength_static_0500
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('ArkUX_Stage_TextArea_MaxLength_static_0500', Level.LEVEL1, async (done: ()=>void) => {
    //   await forKey("TextStr", "");
    //   try {
    //     let strJson = inspector.getInspectorByKey('TextArea');
    //     console.info('ArkUX_Stage_TextArea_MaxLength_static_0500 START :' + JSON.stringify(strJson));
    //     let obj = JSON.parseJsonElement(strJson);
    //     console.info('ArkUX_Stage_TextArea_MaxLength_static_0500 obj $attrs.maxLength :' + JSON.stringify(obj.getElement('$attrs').getString('maxLength')));
    //     expect(obj.getElement('$attrs').getString('maxLength')).assertEqual("INF")
    //     done()
    //   } catch (err) {
    //     expect().assertFail()
    //     console.info('ArkUX_Stage_TextArea_MaxLength_static_0500 err  :' + JSON.stringify(err))
    //     done()
    //   }
    // })

    
    /**
     * @tc.number   ArkUX_Stage_TextArea_MaxLength_static_0600
     * @tc.name     ArkUX_Stage_TextArea_MaxLength_static_0600
     * @tc.desc     ArkUX_Stage_TextArea_MaxLength_static_0600
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_TextArea_MaxLength_static_0600', Level.LEVEL1, async (done: ()=>void) => {
      await forKey("TextErr", "null");
      try {
        let strJson = inspector.getInspectorByKey('TextArea');
        console.info('ArkUX_Stage_TextArea_MaxLength_static_0600 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextArea_MaxLength_static_0600 obj $attrs.maxLength :' + JSON.stringify(obj.getElement('$attrs').getString('maxLength')));
        await sleep(5000)
        expect(obj.getElement('$attrs').getString('maxLength')).assertEqual("INF")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextArea_MaxLength_static_0600 err  :' + JSON.stringify(err))
        done()
      }
    })

    
    /**
     * @tc.number   ArkUX_Stage_TextArea_MaxLength_static_0700
     * @tc.name     ArkUX_Stage_TextArea_MaxLength_static_0700
     * @tc.desc     ArkUX_Stage_TextArea_MaxLength_static_0700
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_TextArea_MaxLength_static_0700', Level.LEVEL1, async (done: ()=>void) => {
      await forKey("TextErr", "undefined");
      try {
        let strJson = inspector.getInspectorByKey('TextArea');
        console.info('ArkUX_Stage_TextArea_MaxLength_static_0700 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextArea_MaxLength_static_0700 obj $attrs.maxLength :' + JSON.stringify(obj.getElement('$attrs').getString('maxLength')));
        await sleep(7000)
        expect(obj.getElement('$attrs').getString('maxLength')).assertEqual("INF")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextArea_MaxLength_static_0700 err  :' + JSON.stringify(err))
        done()
      }
    })

    
    /**
     * @tc.number   ArkUX_Stage_TextArea_MaxLength_static_0800
     * @tc.name     ArkUX_Stage_TextArea_MaxLength_static_0800
     * @tc.desc     ArkUX_Stage_TextArea_MaxLength_static_0800
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_TextArea_MaxLength_static_0800', Level.LEVEL1, async (done: ()=>void) => {
      await forKey("TextNum", "5");
      await forKey("TextNum", "10");
      try {
        let strJson = inspector.getInspectorByKey('TextArea');
        console.info('ArkUX_Stage_TextArea_MaxLength_static_0800 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextArea_MaxLength_static_0800 obj $attrs.maxLength :' + JSON.stringify(obj.getElement('$attrs').getString('maxLength')));
        expect(obj.getElement('$attrs').getString('maxLength')).assertEqual("10")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextArea_MaxLength_static_0800 err  :' + JSON.stringify(err))
        done()
      }
    })

    
    /**
     * @tc.number   ArkUX_Stage_TextArea_MaxLength_0900
     * @tc.name     ArkUX_Stage_TextArea_MaxLength_0900
     * @tc.desc     ArkUX_Stage_TextArea_MaxLength_0900
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_TextArea_MaxLength_0900', Level.LEVEL1, async (done: ()=>void) => {
      await forKey("TextNum", "5");
      await forKey("TextErr", "null");
      try {
        let strJson = inspector.getInspectorByKey('TextArea');
        console.info('ArkUX_Stage_TextArea_MaxLength_0900 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextArea_MaxLength_0900 obj $attrs.maxLength :' + JSON.stringify(obj.getElement('$attrs').getString('maxLength')));
        expect(obj.getElement('$attrs').getString('maxLength')).assertEqual("INF")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextArea_MaxLength_0900 err  :' + JSON.stringify(err))
        done()
      }
    })

    
    /**
     * @tc.number   ArkUX_Stage_TextArea_MaxLength_1000
     * @tc.name     ArkUX_Stage_TextArea_MaxLength_1000
     * @tc.desc     ArkUX_Stage_TextArea_MaxLength_1000
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_TextArea_MaxLength_1000', Level.LEVEL1, async (done: ()=>void) => {
      await forKey("TextErr", "undefined");
      await forKey("TextNum", "5");
      try {
        let strJson = inspector.getInspectorByKey('TextArea');
        console.info('ArkUX_Stage_TextArea_MaxLength_1000 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextArea_MaxLength_1000 obj $attrs.maxLength :' + JSON.stringify(obj.getElement('$attrs').getString('maxLength')));
        expect(obj.getElement('$attrs').getString('maxLength')).assertEqual("5")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextArea_MaxLength_1000 err  :' + JSON.stringify(err))
        done()
      }
    })

    
    /**
     * @tc.number   ArkUX_Stage_TextArea_ShowCounter_0100
     * @tc.name     ArkUX_Stage_TextArea_ShowCounter_0100
     * @tc.desc     ArkUX_Stage_TextArea_ShowCounter_0100
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_TextArea_ShowCounter_0100', Level.LEVEL1, async (done: ()=>void) => {
      await forKey("BoolTrue", "");
      try {
        let strJson = inspector.getInspectorByKey('TextArea');
        console.info('ArkUX_Stage_TextArea_ShowCounter_0100 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextArea_ShowCounter_0100 obj $attrs.showCounter :' + JSON.stringify(obj.getElement('$attrs').getElement('showCounter')));
        expect(obj.getElement('$attrs').getElement('showCounter').getBoolean('value')).assertEqual(true)
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextArea_ShowCounter_0100 err  :' + JSON.stringify(err))
        done()
      }
    })

    
    /**
     * @tc.number   ArkUX_Stage_TextArea_ShowCounter_0200
     * @tc.name     ArkUX_Stage_TextArea_ShowCounter_0200
     * @tc.desc     ArkUX_Stage_TextArea_ShowCounter_0200
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_TextArea_ShowCounter_0200', Level.LEVEL1, async (done: ()=>void) => {
      await forKey("BoolFalse", "");
      try {
        let strJson = inspector.getInspectorByKey('TextArea');
        console.info('ArkUX_Stage_TextArea_ShowCounter_0200 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextArea_ShowCounter_0200 obj $attrs.showCounter :' + JSON.stringify(obj.getElement('$attrs').getElement('showCounter')));
        expect(obj.getElement('$attrs').getElement('showCounter').getBoolean('value')).assertEqual(false)
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextArea_ShowCounter_0200 err  :' + JSON.stringify(err))
        done()
      }
    })

    //  异常值用例
    // /*
    //  * @tc.number   ArkUX_Stage_TextArea_ShowCounter_0300
    //  * @tc.name     ArkUX_Stage_TextArea_ShowCounter_0300
    //  * @tc.desc     ArkUX_Stage_TextArea_ShowCounter_0300
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('ArkUX_Stage_TextArea_ShowCounter_0300', Level.LEVEL1, async (done: ()=>void) => {
    //   await forKey("BoolErrNum", "1");
    //   try {
    //     let strJson = inspector.getInspectorByKey('TextArea');
    //     console.info('ArkUX_Stage_TextArea_ShowCounter_0300 START :' + JSON.stringify(strJson));
    //     let obj = JSON.parseJsonElement(strJson);
    //     console.info('ArkUX_Stage_TextArea_ShowCounter_0300 obj $attrs.showCounter :' + JSON.stringify(obj.getElement('$attrs').getElement('showCounter')));
    //     expect(obj.getElement('$attrs').getElement('showCounter').getString('value')).assertEqual(false)
    //     done()
    //   } catch (err) {
    //     expect().assertFail()
    //     console.info('ArkUX_Stage_TextArea_ShowCounter_0300 err  :' + JSON.stringify(err))
    //     done()
    //   }
    // })

    //  异常值用例
    // /*
    //  * @tc.number   ArkUX_Stage_TextArea_ShowCounter_0400
    //  * @tc.name     ArkUX_Stage_TextArea_ShowCounter_0400
    //  * @tc.desc     ArkUX_Stage_TextArea_ShowCounter_0400
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('ArkUX_Stage_TextArea_ShowCounter_0400', Level.LEVEL1, async (done: ()=>void) => {
    //   await forKey("BoolErrStr", "");
    //   try {
    //     let strJson = inspector.getInspectorByKey('TextArea');
    //     console.info('ArkUX_Stage_TextArea_ShowCounter_0400 START :' + JSON.stringify(strJson));
    //     let obj = JSON.parseJsonElement(strJson);
    //     console.info('ArkUX_Stage_TextArea_ShowCounter_0400 obj $attrs.showCounter :' + JSON.stringify(obj.getElement('$attrs').getElement('showCounter')));
    //     expect(obj.getElement('$attrs').getElement('showCounter').getString('value')).assertEqual(false)
    //     done()
    //   } catch (err) {
    //     expect().assertFail()
    //     console.info('ArkUX_Stage_TextArea_ShowCounter_0400 err  :' + JSON.stringify(err))
    //     done()
    //   }
    // })

    // 异常值用例
    // /*
    //  * @tc.number   ArkUX_Stage_TextArea_ShowCounter_0500
    //  * @tc.name     ArkUX_Stage_TextArea_ShowCounter_0500
    //  * @tc.desc     ArkUX_Stage_TextArea_ShowCounter_0500
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('ArkUX_Stage_TextArea_ShowCounter_0500', Level.LEVEL1, async (done: ()=>void) => {
    //   await forKey("BoolErrNull", "");
    //   try {
    //     let strJson = inspector.getInspectorByKey('TextArea');
    //     console.info('ArkUX_Stage_TextArea_ShowCounter_0500 START :' + JSON.stringify(strJson));
    //     let obj = JSON.parseJsonElement(strJson);
    //     console.info('ArkUX_Stage_TextArea_ShowCounter_0500 obj $attrs.ShowCounter :' + JSON.stringify(obj.getElement('$attrs').getElement('showCounter')));
    //     expect(obj.getElement('$attrs').getElement('showCounter').getString('value')).assertEqual(false)
    //     done()
    //   } catch (err) {
    //     expect().assertFail()
    //     console.info('ArkUX_Stage_TextArea_ShowCounter_0500 err  :' + JSON.stringify(err))
    //     done()
    //   }
    // })

    
    /**
     * @tc.number   ArkUX_Stage_TextArea_ShowCounter_0600
     * @tc.name     ArkUX_Stage_TextArea_ShowCounter_0600
     * @tc.desc     ArkUX_Stage_TextArea_ShowCounter_0600
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_TextArea_ShowCounter_0600', Level.LEVEL1, async (done: ()=>void) => {
      await forKey("BoolErrUndefined", "");
      try {
        let strJson = inspector.getInspectorByKey('TextArea');
        console.info('ArkUX_Stage_TextArea_ShowCounter_0600 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextArea_ShowCounter_0600 obj $attrs.ShowCounter :' + JSON.stringify(obj.getElement('$attrs').getElement('showCounter')));
        expect(obj.getElement('$attrs').getElement('showCounter').getBoolean('value')).assertEqual(false)
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextArea_ShowCounter_0600 err  :' + JSON.stringify(err))
        done()
      }
    })

    
    /**
     * @tc.number   ArkUX_Stage_TextArea_ShowCounter_0700
     * @tc.name     ArkUX_Stage_TextArea_ShowCounter_0700
     * @tc.desc     ArkUX_Stage_TextArea_ShowCounter_0700
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_TextArea_ShowCounter_0700', Level.LEVEL1, async (done: ()=>void) => {
      await forKey("BoolTrue", "");
      await forKey("BoolFalse", "");
      try {
        let strJson = inspector.getInspectorByKey('TextArea');
        console.info('ArkUX_Stage_TextArea_ShowCounter_0700 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextArea_ShowCounter_0700 obj $attrs.ShowCounter :' + JSON.stringify(obj.getElement('$attrs').getElement('showCounter')));
        expect(obj.getElement('$attrs').getElement('showCounter').getBoolean('value')).assertEqual(false)
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextArea_ShowCounter_0700 err  :' + JSON.stringify(err))
        done()
      }
    })

    // 异常值用例
    // /*
    //  * @tc.number   ArkUX_Stage_TextArea_ShowCounter_0800
    //  * @tc.name     ArkUX_Stage_TextArea_ShowCounter_0800
    //  * @tc.desc     ArkUX_Stage_TextArea_ShowCounter_0800
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('ArkUX_Stage_TextArea_ShowCounter_0800', Level.LEVEL1, async (done: ()=>void) => {
    //   await forKey("BoolTrue", "");
    //   await forKey("BoolErrNull", "");
    //   try {
    //     let strJson = inspector.getInspectorByKey('TextArea');
    //     console.info('ArkUX_Stage_TextArea_ShowCounter_0800 START :' + JSON.stringify(strJson));
    //     let obj = JSON.parseJsonElement(strJson);
    //     console.info('ArkUX_Stage_TextArea_ShowCounter_0800 obj $attrs.ShowCounter :' + JSON.stringify(obj.getElement('$attrs').getElement('showCounter')));
    //     expect(obj.getElement('$attrs').getElement('showCounter').getString('value')).assertEqual(false)
    //     done()
    //   } catch (err) {
    //     expect().assertFail()
    //     console.info('ArkUX_Stage_TextArea_ShowCounter_0800 err  :' + JSON.stringify(err))
    //     done()
    //   }
    // })

    
    /**
     * @tc.number   ArkUX_Stage_TextArea_ShowCounter_0900
     * @tc.name     ArkUX_Stage_TextArea_ShowCounter_0900
     * @tc.desc     ArkUX_Stage_TextArea_ShowCounter_0900
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_TextArea_ShowCounter_0900', Level.LEVEL1, async (done: ()=>void) => {
      await forKey("BoolErrUndefined", "");
      await forKey("BoolTrue", "");
      try {
        let strJson = inspector.getInspectorByKey('TextArea');
        console.info('ArkUX_Stage_TextArea_ShowCounter_0900 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextArea_ShowCounter_0900 obj $attrs.ShowCounter :' + JSON.stringify(obj.getElement('$attrs').getElement('showCounter')));
        expect(obj.getElement('$attrs').getElement('showCounter').getBoolean('value')).assertEqual(true)
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextArea_ShowCounter_0900 err  :' + JSON.stringify(err))
        done()
      }
    })


    
    /**
     * @tc.number   ArkUX_Stage_TextArea_0100
     * @tc.name     ArkUX_Stage_TextArea_0100
     * @tc.desc     ArkUX_Stage_TextArea_0100
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_TextArea_0100', Level.LEVEL1, async (done: ()=>void) => {
      try {
        let strJson = inspector.getInspectorByKey('TextAreaNo');
        console.info('ArkUX_Stage_TextArea_0100 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        expect(obj.getElement('$attrs').getElement('showCounter').getBoolean('value')).assertEqual(false)
        expect(obj.getElement('$attrs').getString('maxLength')).assertEqual("INF")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextArea_0100 err  :' + JSON.stringify(err))
        done()
      }
    })

    
    /**
     * @tc.number   ArkUX_Stage_TextArea_barState_0100
     * @tc.name     ArkUX_Stage_TextArea_barState_0100
     * @tc.desc     ArkUX_Stage_TextArea_barState_0100
     * @tc.level    Level.LEVEL0
     */
    it('ArkUX_Stage_TextArea_barState_0100', Level.LEVEL0, async (done: ()=>void) => {
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextArea_barState_0100');
          let obj = JSON.parseJsonElement(strJson);
          console.log("ArkUX_Stage_TextArea_barState_0100 barState:" + JSON.stringify(obj.getElement('$attrs').getString('barState')))
          expect(obj.getElement('$attrs').getString('barState')).assertEqual("BarState.OFF");
        } catch (err) {
          console.info('ArkUX_Stage_TextArea_barState_0100 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    
    /**
     * @tc.number   ArkUX_Stage_TextArea_barState_0200
     * @tc.name     ArkUX_Stage_TextArea_barState_0200
     * @tc.desc     ArkUX_Stage_TextArea_barState_0200
     * @tc.level    Level.LEVEL0
     */
    it('ArkUX_Stage_TextArea_barState_0200', Level.LEVEL0, async (done: ()=>void) => {
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextArea_barState_0200');
          let obj = JSON.parseJsonElement(strJson);
          console.log("ArkUX_Stage_TextArea_barState_0200 barState:" + JSON.stringify(obj.getElement('$attrs').getString('barState')))
          expect(obj.getElement('$attrs').getString('barState')).assertEqual("BarState.AUTO");
        } catch (err) {
          console.info('ArkUX_Stage_TextArea_barState_0200 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    
    /**
     * @tc.number   ArkUX_Stage_TextArea_barState_0300
     * @tc.name     ArkUX_Stage_TextArea_barState_0300
     * @tc.desc     ArkUX_Stage_TextArea_barState_0300
     * @tc.level    Level.LEVEL0
     */
    it('ArkUX_Stage_TextArea_barState_0300', Level.LEVEL0, async (done: ()=>void) => {
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextArea_barState_0300');
          let obj = JSON.parseJsonElement(strJson);
          console.log("ArkUX_Stage_TextArea_barState_0300 barState:" + JSON.stringify(obj.getElement('$attrs').getString('barState')))
          expect(obj.getElement('$attrs').getString('barState')).assertEqual("BarState.ON");
        } catch (err) {
          console.info('ArkUX_Stage_TextArea_barState_0300 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    
    /**
     * @tc.number   ArkUX_Stage_TextArea_barState_0400
     * @tc.name     ArkUX_Stage_TextArea_barState_0400
     * @tc.desc     ArkUX_Stage_TextArea_barState_0400
     * @tc.level    Level.LEVEL0
     */
    it('ArkUX_Stage_TextArea_barState_0400', Level.LEVEL0, async (done: ()=>void) => {
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextArea_barState_0400');
          let obj = JSON.parseJsonElement(strJson);
          console.log("ArkUX_Stage_TextArea_barState_0400 barState:" + JSON.stringify(obj.getElement('$attrs').getString('barState')))
          expect(obj.getElement('$attrs').getString('barState')).assertEqual("BarState.AUTO");
        } catch (err) {
          console.info('ArkUX_Stage_TextArea_barState_0400 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    
    /**
     * @tc.number   ArkUX_Stage_TextArea_barState_0500
     * @tc.name     ArkUX_Stage_TextArea_barState_0500
     * @tc.desc     ArkUX_Stage_TextArea_barState_0500
     * @tc.level    Level.LEVEL0
     */
    it('ArkUX_Stage_TextArea_barState_0500', Level.LEVEL0, async (done: ()=>void) => {
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextArea_barState_0500');
          let obj = JSON.parseJsonElement(strJson);
          console.log("ArkUX_Stage_TextArea_barState_0500 barState:" + JSON.stringify(obj.getElement('$attrs').getString('barState')))
          expect(obj.getElement('$attrs').getString('barState')).assertEqual("BarState.OFF");
        } catch (err) {
          console.info('ArkUX_Stage_TextArea_barState_0500 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    
    /**
     * @tc.number   ArkUX_Stage_TextArea_barState_0600
     * @tc.name     ArkUX_Stage_TextArea_barState_0600
     * @tc.desc     ArkUX_Stage_TextArea_barState_0600
     * @tc.level    Level.LEVEL0
     */
    it('ArkUX_Stage_TextArea_barState_0600', Level.LEVEL0, async (done: ()=>void) => {
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextArea_barState_0600');
          let obj = JSON.parseJsonElement(strJson);
          console.log("ArkUX_Stage_TextArea_barState_0600 barState:" + JSON.stringify(obj.getElement('$attrs').getString('barState')))
          expect(obj.getElement('$attrs').getString('barState')).assertEqual("BarState.AUTO");
        } catch (err) {
          console.info('ArkUX_Stage_TextArea_barState_0600 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    
    /**
     * @tc.number   ArkUX_Stage_TextArea_barState_0700
     * @tc.name     ArkUX_Stage_TextArea_barState_0700
     * @tc.desc     ArkUX_Stage_TextArea_barState_0700
     * @tc.level    Level.LEVEL0
     */
    it('ArkUX_Stage_TextArea_barState_0700', Level.LEVEL0, async (done: ()=>void) => {
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextArea_barState_0700');
          let obj = JSON.parseJsonElement(strJson);
          console.log("ArkUX_Stage_TextArea_barState_0700 barState:" + JSON.stringify(obj.getElement('$attrs').getString('barState')))
          expect(obj.getElement('$attrs').getString('barState')).assertEqual("BarState.AUTO");
        } catch (err) {
          console.info('ArkUX_Stage_TextArea_barState_0700 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    
    /**
     * @tc.number   ArkUX_Stage_TextArea_barState_0800
     * @tc.name     ArkUX_Stage_TextArea_barState_0800
     * @tc.desc     ArkUX_Stage_TextArea_barState_0800
     * @tc.level    Level.LEVEL0
     */
    it('ArkUX_Stage_TextArea_barState_0800', Level.LEVEL0, async (done: ()=>void) => {
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextArea_barState_0800');
          let obj = JSON.parseJsonElement(strJson);
          console.log("ArkUX_Stage_TextArea_barState_0800 barState:" + JSON.stringify(obj.getElement('$attrs').getString('barState')))
          expect(obj.getElement('$attrs').getString('barState')).assertEqual("BarState.AUTO");
        } catch (err) {
          console.info('ArkUX_Stage_TextArea_barState_0800 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    
    /**
     * @tc.number   ArkUX_Stage_TextArea_barState_0900
     * @tc.name     ArkUX_Stage_TextArea_barState_0900
     * @tc.desc     ArkUX_Stage_TextArea_barState_0900
     * @tc.level    Level.LEVEL0
     */
    it('ArkUX_Stage_TextArea_barState_0900', Level.LEVEL0, async (done: ()=>void) => {
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextArea_barState_0900');
          let obj = JSON.parseJsonElement(strJson);
          console.log("ArkUX_Stage_TextArea_barState_0900 barState:" + JSON.stringify(obj.getElement('$attrs').getString('barState')))
          expect(obj.getElement('$attrs').getString('barState')).assertEqual("BarState.AUTO");
        } catch (err) {
          console.info('ArkUX_Stage_TextArea_barState_0900 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    
    /**
     * @tc.number   ArkUX_Stage_TextArea_barState_1000
     * @tc.name     ArkUX_Stage_TextArea_barState_1000
     * @tc.desc     ArkUX_Stage_TextArea_barState_1000
     * @tc.level    Level.LEVEL0
     */
    it('ArkUX_Stage_TextArea_barState_1000', Level.LEVEL0, async (done: ()=>void) => {
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextArea_barState_1000');
          let obj = JSON.parseJsonElement(strJson);
          console.log("ArkUX_Stage_TextArea_barState_1000 barState:" + JSON.stringify(obj.getElement('$attrs').getString('barState')))
          expect(obj.getElement('$attrs').getString('barState')).assertEqual("BarState.AUTO");
        } catch (err) {
          console.info('ArkUX_Stage_TextArea_barState_1000 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    
    /**
     * @tc.number   ArkUX_Stage_TextArea_barState_1100
     * @tc.name     ArkUX_Stage_TextArea_barState_1100
     * @tc.desc     ArkUX_Stage_TextArea_barState_1100
     * @tc.level    Level.LEVEL0
     */
    it('ArkUX_Stage_TextArea_barState_1100', Level.LEVEL0, async (done: ()=>void) => {
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextArea_barState_1100');
          let obj = JSON.parseJsonElement(strJson);
          console.log("ArkUX_Stage_TextArea_barState_1100 barState:" + JSON.stringify(obj.getElement('$attrs').getString('barState')))
          expect(obj.getElement('$attrs').getString('barState')).assertEqual("BarState.AUTO");
        } catch (err) {
          console.info('ArkUX_Stage_TextArea_barState_1100 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    
    /**
     * @tc.number   ArkUX_Stage_TextArea_barState_1200
     * @tc.name     ArkUX_Stage_TextArea_barState_1200
     * @tc.desc     ArkUX_Stage_TextArea_barState_1200
     * @tc.level    Level.LEVEL0
     */
    it('ArkUX_Stage_TextArea_barState_1200', Level.LEVEL0, async (done: ()=>void) => {
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextArea_barState_1200');
          let obj = JSON.parseJsonElement(strJson);
          console.log("ArkUX_Stage_TextArea_barState_1200 barState:" + JSON.stringify(obj.getElement('$attrs').getString('barState')))
          expect(obj.getElement('$attrs').getString('barState')).assertEqual("BarState.ON");
        } catch (err) {
          console.info('ArkUX_Stage_TextArea_barState_1200 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    
    /**
     * @tc.number   ArkUX_Stage_TextArea_barState_1300
     * @tc.name     ArkUX_Stage_TextArea_barState_1300
     * @tc.desc     ArkUX_Stage_TextArea_barState_1300
     * @tc.level    Level.LEVEL0
     */
    it('ArkUX_Stage_TextArea_barState_1300', Level.LEVEL0, async (done: ()=>void) => {
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('TextAreaNO');
          let obj = JSON.parseJsonElement(strJson);
          console.log("ArkUX_Stage_TextArea_barState_1300 barState:" + JSON.stringify(obj.getElement('$attrs').getString('barState')))
          expect(obj.getElement('$attrs').getString('barState')).assertEqual("BarState.AUTO");
        } catch (err) {
          console.info('ArkUX_Stage_TextArea_barState_1300 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    
    /**
     * @tc.number   ArkUX_Stage_TextArea_barState_1400
     * @tc.name     ArkUX_Stage_TextArea_barState_1400
     * @tc.desc     ArkUX_Stage_TextArea_barState_1400
     * @tc.level    Level.LEVEL0
     */
    it('ArkUX_Stage_TextArea_barState_1400', Level.LEVEL0, async (done: ()=>void) => {
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('TextAreaStyleDefault');
          let obj = JSON.parseJsonElement(strJson);
          console.log("ArkUX_Stage_TextArea_barState_1400 barState:" + JSON.stringify(obj.getElement('$attrs').getString('barState')))
          expect(obj.getElement('$attrs').getString('barState')).assertEqual("BarState.ON");
        } catch (err) {
          console.info('ArkUX_Stage_TextArea_barState_1400 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    
    /**
     * @tc.number   ArkUX_Stage_TextArea_Style_0100
     * @tc.name     ArkUX_Stage_TextArea_Style_0100
     * @tc.desc     ArkUX_Stage_TextArea_Style_0100
     * @tc.level    Level.LEVEL0
     */
    it('ArkUX_Stage_TextArea_Style_0100', Level.LEVEL0, async (done: ()=>void) => {
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextArea_Style_0100');
          let obj = JSON.parseJsonElement(strJson);
          console.log("ArkUX_Stage_TextArea_Style_0100 style:" + JSON.stringify(obj.getElement('$attrs').getString('style')))
          expect(obj.getElement('$attrs').getString('style')).assertEqual("TextContentStyle.DEFAULT");
        } catch (err) {
          console.info('ArkUX_Stage_TextArea_Style_0100 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    
    /**
     * @tc.number   ArkUX_Stage_TextArea_Style_0200
     * @tc.name     ArkUX_Stage_TextArea_Style_0200
     * @tc.desc     ArkUX_Stage_TextArea_Style_0200
     * @tc.level    Level.LEVEL0
     */
    it('ArkUX_Stage_TextArea_Style_0200', Level.LEVEL0, async (done: ()=>void) => {
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextArea_Style_0200');
          let obj = JSON.parseJsonElement(strJson);
          console.log("ArkUX_Stage_TextArea_Style_0200 style:" + JSON.stringify(obj.getElement('$attrs').getString('style')))
          expect(obj.getElement('$attrs').getString('style')).assertEqual("TextContentStyle.INLINE");
        } catch (err) {
          console.info('ArkUX_Stage_TextArea_Style_0200 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    
    /**
     * @tc.number   ArkUX_Stage_TextArea_Style_0300
     * @tc.name     ArkUX_Stage_TextArea_Style_0300
     * @tc.desc     ArkUX_Stage_TextArea_Style_0300
     * @tc.level    Level.LEVEL0
     */
    it('ArkUX_Stage_TextArea_Style_0300', Level.LEVEL0, async (done: ()=>void) => {
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextArea_Style_0300');
          let obj = JSON.parseJsonElement(strJson);
          console.log("ArkUX_Stage_TextArea_Style_0300 style:" + JSON.stringify(obj.getElement('$attrs').getString('style')))
          expect(obj.getElement('$attrs').getString('style')).assertEqual("TextContentStyle.DEFAULT");
        } catch (err) {
          console.info('ArkUX_Stage_TextArea_Style_0300 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    
    /**
     * @tc.number   ArkUX_Stage_TextArea_Style_0400
     * @tc.name     ArkUX_Stage_TextArea_Style_0400
     * @tc.desc     ArkUX_Stage_TextArea_Style_0400
     * @tc.level    Level.LEVEL0
     */
    it('ArkUX_Stage_TextArea_Style_0400', Level.LEVEL0, async (done: ()=>void) => {
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextArea_Style_0400');
          let obj = JSON.parseJsonElement(strJson);
          console.log("ArkUX_Stage_TextArea_Style_0400 style:" + JSON.stringify(obj.getElement('$attrs').getString('style')))
          expect(obj.getElement('$attrs').getString('style')).assertEqual("TextContentStyle.DEFAULT");
        } catch (err) {
          console.info('ArkUX_Stage_TextArea_Style_0400 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    
    /**
     * @tc.number   ArkUX_Stage_TextArea_Style_0500
     * @tc.name     ArkUX_Stage_TextArea_Style_0500
     * @tc.desc     ArkUX_Stage_TextArea_Style_0500
     * @tc.level    Level.LEVEL0
     */
    it('ArkUX_Stage_TextArea_Style_0500', Level.LEVEL0, async (done: ()=>void) => {
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextArea_Style_0500');
          let obj = JSON.parseJsonElement(strJson);
          console.log("ArkUX_Stage_TextArea_Style_0500 style:" + JSON.stringify(obj.getElement('$attrs').getString('style')))
          expect(obj.getElement('$attrs').getString('style')).assertEqual("TextContentStyle.DEFAULT");
        } catch (err) {
          console.info('ArkUX_Stage_TextArea_Style_0500 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    
    /**
     * @tc.number   ArkUX_Stage_TextArea_Style_0600
     * @tc.name     ArkUX_Stage_TextArea_Style_0600
     * @tc.desc     ArkUX_Stage_TextArea_Style_0600
     * @tc.level    Level.LEVEL0
     */
    it('ArkUX_Stage_TextArea_Style_0600', Level.LEVEL0, async (done: ()=>void) => {
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextArea_Style_0600');
          let obj = JSON.parseJsonElement(strJson);
          console.log("ArkUX_Stage_TextArea_Style_0600 style:" + JSON.stringify(obj.getElement('$attrs').getString('style')))
          expect(obj.getElement('$attrs').getString('style')).assertEqual("TextContentStyle.DEFAULT");
        } catch (err) {
          console.info('ArkUX_Stage_TextArea_Style_0600 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    
    /**
     * @tc.number   ArkUX_Stage_TextArea_Style_0700
     * @tc.name     ArkUX_Stage_TextArea_Style_0700
     * @tc.desc     ArkUX_Stage_TextArea_Style_0700
     * @tc.level    Level.LEVEL0
     */
    it('ArkUX_Stage_TextArea_Style_0700', Level.LEVEL0, async (done: ()=>void) => {
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextArea_Style_0700');
          let obj = JSON.parseJsonElement(strJson);
          console.log("ArkUX_Stage_TextArea_Style_0700 style:" + JSON.stringify(obj.getElement('$attrs').getString('style')))
          expect(obj.getElement('$attrs').getString('style')).assertEqual("TextContentStyle.DEFAULT");
        } catch (err) {
          console.info('ArkUX_Stage_TextArea_Style_0700 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    
    /**
     * @tc.number   ArkUX_Stage_TextArea_Style_0800
     * @tc.name     ArkUX_Stage_TextArea_Style_0800
     * @tc.desc     ArkUX_Stage_TextArea_Style_0800
     * @tc.level    Level.LEVEL0
     */
    it('ArkUX_Stage_TextArea_Style_0800', Level.LEVEL0, async (done: ()=>void) => {
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextArea_Style_0800');
          let obj = JSON.parseJsonElement(strJson);
          console.log("ArkUX_Stage_TextArea_Style_0800 style:" + JSON.stringify(obj.getElement('$attrs').getString('style')))
          expect(obj.getElement('$attrs').getString('style')).assertEqual("TextContentStyle.DEFAULT");
        } catch (err) {
          console.info('ArkUX_Stage_TextArea_Style_0800 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    
    /**
     * @tc.number   ArkUX_Stage_TextArea_Style_0900
     * @tc.name     ArkUX_Stage_TextArea_Style_0900
     * @tc.desc     ArkUX_Stage_TextArea_Style_0900
     * @tc.level    Level.LEVEL0
     */
    it('ArkUX_Stage_TextArea_Style_0900', Level.LEVEL0, async (done: ()=>void) => {
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextArea_Style_0900');
          let obj = JSON.parseJsonElement(strJson);
          console.log("ArkUX_Stage_TextArea_Style_0900 style:" + JSON.stringify(obj.getElement('$attrs').getString('style')))
          expect(obj.getElement('$attrs').getString('style')).assertEqual("TextContentStyle.INLINE");
        } catch (err) {
          console.info('ArkUX_Stage_TextArea_Style_0900 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    
    /**
     * @tc.number   ArkUX_Stage_TextArea_Style_1000
     * @tc.name     ArkUX_Stage_TextArea_Style_1000
     * @tc.desc     ArkUX_Stage_TextArea_Style_1000
     * @tc.level    Level.LEVEL0
     */
    it('ArkUX_Stage_TextArea_Style_1000', Level.LEVEL0, async (done: ()=>void) => {
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextArea_Style_1000');
          let obj = JSON.parseJsonElement(strJson);
          console.log("ArkUX_Stage_TextArea_Style_1000 style:" + JSON.stringify(obj.getElement('$attrs').getString('style')))
          expect(obj.getElement('$attrs').getString('style')).assertEqual("TextContentStyle.INLINE");
        } catch (err) {
          console.info('ArkUX_Stage_TextArea_Style_1000 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    
    /**
     * @tc.number   ArkUX_Stage_TextArea_Style_1100
     * @tc.name     ArkUX_Stage_TextArea_Style_1100
     * @tc.desc     ArkUX_Stage_TextArea_Style_1100
     * @tc.level    Level.LEVEL0
     */
    it('ArkUX_Stage_TextArea_Style_1100', Level.LEVEL0, async (done: ()=>void) => {
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextArea_Style_1100');
          let obj = JSON.parseJsonElement(strJson);
          console.log("ArkUX_Stage_TextArea_Style_1100 style:" + JSON.stringify(obj.getElement('$attrs').getString('style')))
          expect(obj.getElement('$attrs').getString('style')).assertEqual("TextContentStyle.DEFAULT");
        } catch (err) {
          console.info('ArkUX_Stage_TextArea_Style_1100 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    
    /**
     * @tc.number   ArkUX_Stage_TextArea_Style_1200
     * @tc.name     ArkUX_Stage_TextArea_Style_1200
     * @tc.desc     ArkUX_Stage_TextArea_Style_1200
     * @tc.level    Level.LEVEL0
     */
    it('ArkUX_Stage_TextArea_Style_1200', Level.LEVEL0, async (done: ()=>void) => {
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('TextAreaStyleDefault');
          let obj = JSON.parseJsonElement(strJson);
          console.log("ArkUX_Stage_TextArea_Style_1200 style:" + JSON.stringify(obj.getElement('$attrs').getString('style')))
          expect(obj.getElement('$attrs').getString('style')).assertEqual("TextContentStyle.DEFAULT");
        } catch (err) {
          console.info('ArkUX_Stage_TextArea_Style_1200 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

  })
}