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
import { describe, beforeEach, afterEach, it, expect, Level,beforeAll } from "../../../../hypium/index"
import CommonFunc from '../../../ets/MainAbility/common/Common';
import router from '@ohos.router';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
let emitKey = "emitUserAgent";
function sleep(time: number) {
  return new Promise<string>((resolve, reject) => {
    setTimeout(():void => {
      resolve("ok")
    }, time as Int)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}

export default function textInputTest() {
  describe('ActsTextInputTest', () => {

    beforeAll(() => {
      console.info("ActsTextInputTest beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("ActsTextInputTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextInput/TextinputIndex",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get ActsTextInputTest state pages:" + JSON.stringify(pages));
        if (!("TextinputIndex" == pages.name)) {
          console.info("get ActsTextInputTest pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ActsTextInputTest page error:" + err);
      }
      console.info("ActsTextInputTest beforeEach end");
    });


    
    /**
     * @tc.number   ArkUX_Stage_TextInput_CaretPosition_static_0100
     * @tc.name     ArkUX_Stage_TextInput_CaretPosition_static_0100
     * @tc.desc     ArkUX_Stage_TextInput_CaretPosition_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_TextInput_CaretPosition_static_0100', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Badge_FontWeight_0100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_CaretPosition_static_0100');
          console.info('ArkUX_Stage_TextInput_CaretPosition_static_0100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_TextInput_CaretPosition_static_0100 component obj.getElement('$attrs').getString('caretPosition') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('caretPosition')));
          expect(obj.getElement('$attrs').getString('caretPosition')).assertEqual("0");
          console.info('ArkUX_Stage_TextInput_CaretPosition_static_0100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_CaretPosition_static_0100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 5000)
    });

    
    /**
     * @tc.number   ArkUX_Stage_TextInput_CaretPosition_static_0200
     * @tc.name     ArkUX_Stage_TextInput_CaretPosition_static_0200
     * @tc.desc     ArkUX_Stage_TextInput_CaretPosition_static_0200
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_TextInput_CaretPosition_static_0200', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_TextInput_CaretPosition_static_0200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_CaretPosition_static_0200');
          console.info('ArkUX_Stage_TextInput_CaretPosition_static_0200 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_TextInput_CaretPosition_static_0200 component obj.getElement('$attrs').getString('caretPosition') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('caretPosition')));
          expect(obj.getElement('$attrs').getString('caretPosition')).assertEqual("0");
          console.info('ArkUX_Stage_TextInput_CaretPosition_static_0200 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_CaretPosition_static_0200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    /**
     * @tc.number   ArkUX_Stage_TextInput_CaretPosition_static_0300
     * @tc.name     ArkUX_Stage_TextInput_CaretPosition_static_0300
     * @tc.desc     ArkUX_Stage_TextInput_CaretPosition_static_0300
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_TextInput_CaretPosition_static_0300', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_TextInput_CaretPosition_static_0300 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_CaretPosition_static_0300');
          console.info('ArkUX_Stage_TextInput_CaretPosition_static_0300 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_TextInput_CaretPosition_static_0300 component obj.getElement('$attrs').getString('caretPosition') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('caretPosition')));
          expect(obj.getElement('$attrs').getString('caretPosition')).assertEqual("7");
          console.info('ArkUX_Stage_TextInput_CaretPosition_static_0300 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_CaretPosition_static_0300 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    /**
     * @tc.number   ArkUX_Stage_TextInput_CaretPosition_static_0400
     * @tc.name     ArkUX_Stage_TextInput_CaretPosition_static_0400
     * @tc.desc     ArkUX_Stage_TextInput_CaretPosition_static_0400
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_TextInput_CaretPosition_static_0400', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_TextInput_CaretPosition_static_0400 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_CaretPosition_static_0400');
          console.info('ArkUX_Stage_TextInput_CaretPosition_static_0400 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_TextInput_CaretPosition_static_0400 component obj.getElement('$attrs').getString('caretPosition') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('caretPosition')));
          expect(obj.getElement('$attrs').getString('caretPosition')).assertEqual("7");
          console.info('ArkUX_Stage_TextInput_CaretPosition_static_0400 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_CaretPosition_static_0400 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    // /*
    //  * @tc.number   ArkUX_Stage_TextInput_CaretPosition_static_0500
    //  * @tc.name     ArkUX_Stage_TextInput_CaretPosition_static_0500
    //  * @tc.desc     ArkUX_Stage_TextInput_CaretPosition_static_0500
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('ArkUX_Stage_TextInput_CaretPosition_static_0500', Level.LEVEL1, async (done: ()=>void) => {
    //   console.info('ArkUX_Stage_TextInput_CaretPosition_static_0400 START');
    //   setTimeout(() => {
    //     try {
    //       let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_CaretPosition_static_0500');
    //       console.info('ArkUX_Stage_TextInput_CaretPosition_static_0500 START  :' + JSON.stringify(strJson));
    //       let obj = JSON.parseJsonElement(strJson);
    //       console.info("ArkUX_Stage_TextInput_CaretPosition_static_0500 component obj.getElement('$attrs').getString('caretPosition') is: " +
    //       JSON.stringify(obj.getElement('$attrs').getString('caretPosition')));
    //       expect(obj.getElement('$attrs').getString('caretPosition')).assertEqual("0");
    //       console.info('ArkUX_Stage_TextInput_CaretPosition_static_0500 END ');
    //     } catch (err) {
    //       expect().assertFail();
    //       console.info('ArkUX_Stage_TextInput_CaretPosition_static_0500 ERR  ' + JSON.stringify(err));
    //     }
    //     done();
    //   }, 500)
    // });

    
    /**
     * @tc.number   ArkUX_Stage_TextInput_CaretPosition_static_0600
     * @tc.name     ArkUX_Stage_TextInput_CaretPosition_static_0600
     * @tc.desc     ArkUX_Stage_TextInput_CaretPosition_static_0600
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_TextInput_CaretPosition_static_0600', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_TextInput_CaretPosition_static_0600 START');
      setTimeout(() => {
        try {
          let str = "input your word..."
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_CaretPosition_static_0600');
          console.info('ArkUX_Stage_TextInput_CaretPosition_static_0600 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_TextInput_CaretPosition_static_0600 component obj.getElement('$attrs').getString('caretPosition') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('caretPosition')));
          expect(obj.getElement('$attrs').getString('caretPosition') != "100").assertTrue();
          expect(obj.getElement('$attrs').getString('caretPosition')).assertEqual(str.length.toString());
          console.info('ArkUX_Stage_TextInput_CaretPosition_static_0600 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_CaretPosition_static_0600 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    // /*
    //  * @tc.number   ArkUX_Stage_TextInput_CaretPosition_static_0700
    //  * @tc.name     ArkUX_Stage_TextInput_CaretPosition_static_0700
    //  * @tc.desc     ArkUX_Stage_TextInput_CaretPosition_static_0700
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('ArkUX_Stage_TextInput_CaretPosition_static_0700', Level.LEVEL1, async (done: ()=>void) => {
    //   console.info('ArkUX_Stage_TextInput_CaretPosition_static_0700 START');
    //   setTimeout(() => {
    //     try {
    //       let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_CaretPosition_static_0700');
    //       console.info('ArkUX_Stage_TextInput_CaretPosition_static_0700 START  :' + JSON.stringify(strJson));
    //       let obj = JSON.parseJsonElement(strJson);
    //       console.info("ArkUX_Stage_TextInput_CaretPosition_static_0700 component obj.getElement('$attrs').getString('caretPosition') is: " +
    //       JSON.stringify(obj.getElement('$attrs').getString('caretPosition')));
    //       expect(obj.getElement('$attrs').getString('caretPosition')).assertEqual("0");
    //       console.info('ArkUX_Stage_TextInput_CaretPosition_static_0700 END ');
    //     } catch (err) {
    //       expect().assertFail();
    //       console.info('ArkUX_Stage_TextInput_CaretPosition_static_0700 ERR  ' + JSON.stringify(err));
    //     }
    //     done();
    //   }, 500)
    // });

    
    /**
     * @tc.number   ArkUX_Stage_TextInput_CaretPosition_static_0800
     * @tc.name     ArkUX_Stage_TextInput_CaretPosition_static_0800
     * @tc.desc     ArkUX_Stage_TextInput_CaretPosition_static_0800
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_TextInput_CaretPosition_static_0800', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_TextInput_CaretPosition_static_0800 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_CaretPosition_static_0800');
          console.info('ArkUX_Stage_TextInput_CaretPosition_static_0800 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_TextInput_CaretPosition_static_0800 component obj.getElement('$attrs').getString('caretPosition') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('caretPosition')));
          expect(obj.getElement('$attrs').getString('caretPosition')).assertEqual("0");
          console.info('ArkUX_Stage_TextInput_CaretPosition_static_0800 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_CaretPosition_static_0800 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    // /*
    //  * @tc.number   ArkUX_Stage_TextInput_CaretPosition_static_0900
    //  * @tc.name     ArkUX_Stage_TextInput_CaretPosition_static_0900
    //  * @tc.desc     ArkUX_Stage_TextInput_CaretPosition_static_0900
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('ArkUX_Stage_TextInput_CaretPosition_static_0900', Level.LEVEL1, async (done: ()=>void) => {
    //   console.info('ArkUX_Stage_TextInput_CaretPosition_static_0900 START');
    //   setTimeout(() => {
    //     try {
    //       let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_CaretPosition_static_0900');
    //       console.info('ArkUX_Stage_TextInput_CaretPosition_static_0900 START  :' + JSON.stringify(strJson));
    //       let obj = JSON.parseJsonElement(strJson);
    //       console.info("ArkUX_Stage_TextInput_CaretPosition_static_0900 component obj.getElement('$attrs').getString('caretPosition') is: " +
    //       JSON.stringify(obj.getElement('$attrs').getString('caretPosition')));
    //       expect(obj.getElement('$attrs').getString('caretPosition')).assertEqual("0");
    //       console.info('ArkUX_Stage_TextInput_CaretPosition_static_0900 END ');
    //     } catch (err) {
    //       expect().assertFail();
    //       console.info('ArkUX_Stage_TextInput_CaretPosition_static_0900 ERR  ' + JSON.stringify(err));
    //     }
    //     done();
    //   }, 500)
    // });

    
    /**
     * @tc.number   ArkUX_Stage_TextInput_CaretPosition_static_1000
     * @tc.name     ArkUX_Stage_TextInput_CaretPosition_static_1000
     * @tc.desc     ArkUX_Stage_TextInput_CaretPosition_static_1000
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_TextInput_CaretPosition_static_1000', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_TextInput_CaretPosition_static_1000 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_CaretPosition_static_1000');
          console.info('ArkUX_Stage_TextInput_CaretPosition_static_1000 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_TextInput_CaretPosition_static_1000 component obj.getElement('$attrs').getString('caretPosition') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('caretPosition')));
          expect(obj.getElement('$attrs').getString('caretPosition')).assertEqual("0");
          console.info('ArkUX_Stage_TextInput_CaretPosition_static_1000 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_CaretPosition_static_1000 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    /**
     * @tc.number   ArkUX_Stage_TextInput_CaretPosition_static_1100
     * @tc.name     ArkUX_Stage_TextInput_CaretPosition_static_1100
     * @tc.desc     ArkUX_Stage_TextInput_CaretPosition_static_1100
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_TextInput_CaretPosition_static_1100', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_TextInput_CaretPosition_static_1100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_CaretPosition_static_1100');
          console.info('ArkUX_Stage_TextInput_CaretPosition_static_1100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_TextInput_CaretPosition_static_1100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_TextInput_CaretPosition_static_1100 component obj.getElement('$attrs').getString('caretPosition') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('caretPosition')));
          expect(obj.getElement('$attrs').getString('caretPosition')).assertEqual("3");
          console.info('ArkUX_Stage_TextInput_CaretPosition_static_1100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_CaretPosition_static_1100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    /**
     * @tc.number   ArkUX_Stage_TextInput_CaretPosition_static_1200
     * @tc.name     ArkUX_Stage_TextInput_CaretPosition_static_1200
     * @tc.desc     ArkUX_Stage_TextInput_CaretPosition_static_1200
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_TextInput_CaretPosition_static_1200', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_TextInput_CaretPosition_static_1200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_CaretPosition_static_1200');
          console.info('ArkUX_Stage_TextInput_CaretPosition_static_1200 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_TextInput_CaretPosition_static_1200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_TextInput_CaretPosition_static_1200 component obj.getElement('$attrs').getString('caretPosition') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('caretPosition')));
          expect(obj.getElement('$attrs').getString('caretPosition')).assertEqual("0");
          console.info('ArkUX_Stage_TextInput_CaretPosition_static_1200 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_CaretPosition_static_1200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    /**
     * @tc.number   ArkUX_Stage_TextInput_CaretPosition_static_1300
     * @tc.name     ArkUX_Stage_TextInput_CaretPosition_static_1300
     * @tc.desc     ArkUX_Stage_TextInput_CaretPosition_static_1300
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_TextInput_CaretPosition_static_1300', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_TextInput_CaretPosition_static_1300 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_CaretPosition_static_1300');
          console.info('ArkUX_Stage_TextInput_CaretPosition_static_1300 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_TextInput_CaretPosition_static_1300 component obj.getElement('$attrs').getString('caretPosition') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('caretPosition')));
          expect(obj.getElement('$attrs').getString('caretPosition')).assertEqual("7");
          console.info('ArkUX_Stage_TextInput_CaretPosition_static_1300 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_CaretPosition_static_1300 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    /**
     * @tc.number   ArkUX_Stage_TextInput_CaretPosition_static_1400
     * @tc.name     ArkUX_Stage_TextInput_CaretPosition_static_1400
     * @tc.desc     ArkUX_Stage_TextInput_CaretPosition_static_1400
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_TextInput_CaretPosition_static_1400', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_TextInput_CaretPosition_static_1400 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_CaretPosition_static_1400');
          console.info('ArkUX_Stage_TextInput_CaretPosition_static_1400 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_TextInput_CaretPosition_static_1400 component obj.getElement('$attrs').getString('caretPosition') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('caretPosition')));
          expect(obj.getElement('$attrs').getString('caretPosition')).assertEqual("70");
          console.info('ArkUX_Stage_TextInput_CaretPosition_static_1400 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_CaretPosition_static_1400 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    /**
     * @tc.number   ArkUX_Stage_TextInput_CaretWidth_static_0100
     * @tc.name     ArkUX_Stage_TextInput_CaretWidth_static_0100
     * @tc.desc     ArkUX_Stage_TextInput_CaretWidth_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_TextInput_CaretWidth_static_0100', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_TextInput_CaretWidth_static_0100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_CaretWidth_static_0100');
          console.info('ArkUX_Stage_TextInput_CaretWidth_static_0100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_TextInput_CaretWidth_static_0100 component obj.getElement('$attrs').getString('caretStyle') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('caretStyle')));
          let cursorStyle  = JSON.parseJsonElement(obj.getElement('$attrs').getString('caretStyle'));
          expect(cursorStyle.getString('width')).assertEqual("0.00vp");
          console.info('ArkUX_Stage_TextInput_CaretWidth_static_0100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_CaretWidth_static_0100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    /**
     * @tc.number   ArkUX_Stage_TextInput_CaretWidth_static_0200
     * @tc.name     ArkUX_Stage_TextInput_CaretWidth_static_0200
     * @tc.desc     ArkUX_Stage_TextInput_CaretWidth_static_0200
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_TextInput_CaretWidth_static_0200', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_TextInput_CaretWidth_static_0200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_CaretWidth_static_0200');
          console.info('ArkUX_Stage_TextInput_CaretWidth_static_0200 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_TextInput_CaretWidth_static_0200 component obj.getElement('$attrs').getString('caretStyle') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('caretStyle')));
          let cursorStyle  = JSON.parseJsonElement(obj.getElement('$attrs').getString('caretStyle'));
          expect(cursorStyle.getString('width')).assertEqual("7.00vp");
          console.info('ArkUX_Stage_TextInput_CaretWidth_static_0200 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_CaretWidth_static_0200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    /**
     * @tc.number   ArkUX_Stage_TextInput_CaretWidth_static_0300
     * @tc.name     ArkUX_Stage_TextInput_CaretWidth_static_0300
     * @tc.desc     ArkUX_Stage_TextInput_CaretWidth_static_0300
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_TextInput_CaretWidth_static_0300', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_TextInput_CaretWidth_static_0300 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_CaretWidth_static_0300');
          console.info('ArkUX_Stage_TextInput_CaretWidth_static_0300 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_TextInput_CaretWidth_static_0300 component obj.getElement('$attrs').getString('caretStyle') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('caretStyle')));
          let cursorStyle  = JSON.parseJsonElement(obj.getElement('$attrs').getString('caretStyle'));
          expect(cursorStyle.getString('width')).assertEqual("7.00vp");
          console.info('ArkUX_Stage_TextInput_CaretWidth_static_0300 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_CaretWidth_static_0300 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    /**
     * @tc.number   ArkUX_Stage_TextInput_CaretWidth_static_0400
     * @tc.name     ArkUX_Stage_TextInput_CaretWidth_static_0400
     * @tc.desc     ArkUX_Stage_TextInput_CaretWidth_static_0400
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_TextInput_CaretWidth_static_0400', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_TextInput_CaretWidth_static_0400 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_CaretWidth_static_0400');
          console.info('ArkUX_Stage_TextInput_CaretWidth_static_0400 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_TextInput_CaretWidth_static_0400 component obj.getElement('$attrs').getString('caretStyle') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('caretStyle')));
          let cursorStyle  = JSON.parseJsonElement(obj.getElement('$attrs').getString('caretStyle'));
          expect(cursorStyle.getString('width')).assertEqual("4.00px");
          console.info('ArkUX_Stage_TextInput_CaretWidth_static_0400 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_CaretWidth_static_0400 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    /**
     * @tc.number   ArkUX_Stage_TextInput_CaretWidth_static_0500
     * @tc.name     ArkUX_Stage_TextInput_CaretWidth_static_0500
     * @tc.desc     ArkUX_Stage_TextInput_CaretWidth_static_0500
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_TextInput_CaretWidth_static_0500', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_TextInput_CaretWidth_static_0500 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_CaretWidth_static_0500');
          console.info('ArkUX_Stage_TextInput_CaretWidth_static_0500 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_TextInput_CaretWidth_static_0500 component obj.getElement('$attrs').getString('caretStyle') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('caretStyle')));
          let cursorStyle  = JSON.parseJsonElement(obj.getElement('$attrs').getString('caretStyle'));
          expect(cursorStyle.getString('width')).assertEqual("2.00vp");
          console.info('ArkUX_Stage_TextInput_CaretWidth_static_0500 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_CaretWidth_static_0500 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    /**
     * @tc.number   ArkUX_Stage_TextInput_CaretWidth_static_0600
     * @tc.name     ArkUX_Stage_TextInput_CaretWidth_static_0600
     * @tc.desc     ArkUX_Stage_TextInput_CaretWidth_static_0600
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_TextInput_CaretWidth_static_0600', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_TextInput_CaretWidth_static_0600 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_CaretWidth_static_0600');
          console.info('ArkUX_Stage_TextInput_CaretWidth_static_0600 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_TextInput_CaretWidth_static_0600 component obj.getElement('$attrs').getString('caretStyle') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('caretStyle')));
          let cursorStyle  = JSON.parseJsonElement(obj.getElement('$attrs').getString('caretStyle'));
          expect(cursorStyle.getString('width')).assertEqual("2.00vp");
          console.info('ArkUX_Stage_TextInput_CaretWidth_static_0600 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_CaretWidth_static_0600 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    /**
     * @tc.number   ArkUX_Stage_TextInput_CaretWidth_static_0700
     * @tc.name     ArkUX_Stage_TextInput_CaretWidth_static_0700
     * @tc.desc     ArkUX_Stage_TextInput_CaretWidth_static_0700
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_TextInput_CaretWidth_static_0700', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_TextInput_CaretWidth_static_0700 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_CaretWidth_static_0700');
          console.info('ArkUX_Stage_TextInput_CaretWidth_static_0700 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_TextInput_CaretWidth_static_0700 component obj.getElement('$attrs').getString('caretStyle') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('caretStyle')));
          let cursorStyle  = JSON.parseJsonElement(obj.getElement('$attrs').getString('caretStyle'));
          expect(cursorStyle.getString('width')).assertEqual("2.00vp");
          console.info('ArkUX_Stage_TextInput_CaretWidth_static_0700 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_CaretWidth_static_0700 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    /**
     * @tc.number   ArkUX_Stage_TextInput_CaretWidth_static_0800
     * @tc.name     ArkUX_Stage_TextInput_CaretWidth_static_0800
     * @tc.desc     ArkUX_Stage_TextInput_CaretWidth_static_0800
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_TextInput_CaretWidth_static_0800', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_TextInput_CaretWidth_static_0800 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_CaretWidth_static_0800');
          console.info('ArkUX_Stage_TextInput_CaretWidth_static_0800 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_TextInput_CaretWidth_static_0800 component obj.getElement('$attrs').getString('caretStyle') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('caretStyle')));
          let cursorStyle  = JSON.parseJsonElement(obj.getElement('$attrs').getString('caretStyle'));
          expect(cursorStyle.getString('width')).assertEqual("2.00vp");
          console.info('ArkUX_Stage_TextInput_CaretWidth_static_0800 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_CaretWidth_static_0800 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    /**
     * @tc.number   ArkUX_Stage_TextInput_CaretWidth_static_0900
     * @tc.name     ArkUX_Stage_TextInput_CaretWidth_static_0900
     * @tc.desc     ArkUX_Stage_TextInput_CaretWidth_static_0900
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_TextInput_CaretWidth_static_0900', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_TextInput_CaretWidth_static_0900 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_CaretWidth_static_0900');
          console.info('ArkUX_Stage_TextInput_CaretWidth_static_0900 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_TextInput_CaretWidth_static_0900 component obj.getElement('$attrs').getString('caretStyle') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('caretStyle')));
          let cursorStyle  = JSON.parseJsonElement(obj.getElement('$attrs').getString('caretStyle'));
          expect(cursorStyle.getString('width')).assertEqual("2.00vp");
          console.info('ArkUX_Stage_TextInput_CaretWidth_static_0900 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_CaretWidth_static_0900 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    /**
     * @tc.number   ArkUX_Stage_TextInput_CaretWidth_static_1000
     * @tc.name     ArkUX_Stage_TextInput_CaretWidth_static_1000
     * @tc.desc     ArkUX_Stage_TextInput_CaretWidth_static_1000
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_TextInput_CaretWidth_static_1000', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_TextInput_CaretWidth_static_1000 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_CaretWidth_static_1000');
          console.info('ArkUX_Stage_TextInput_CaretWidth_static_1000 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_TextInput_CaretWidth_static_1000 component obj.getElement('$attrs').getString('caretStyle') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('caretStyle')));
          let cursorStyle  = JSON.parseJsonElement(obj.getElement('$attrs').getString('caretStyle'));
          expect(cursorStyle.getString('width')).assertEqual("2.00fp");
          console.info('ArkUX_Stage_TextInput_CaretWidth_static_1000 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_CaretWidth_static_1000 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    /**
     * @tc.number   ArkUX_Stage_TextInput_CaretWidth_static_1100
     * @tc.name     ArkUX_Stage_TextInput_CaretWidth_static_1100
     * @tc.desc     ArkUX_Stage_TextInput_CaretWidth_static_1100
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_TextInput_CaretWidth_static_1100', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_TextInput_CaretWidth_static_1100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_CaretWidth_static_1100');
          console.info('ArkUX_Stage_TextInput_CaretWidth_static_1100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_TextInput_CaretWidth_static_1100 component obj.getElement('$attrs').getString('caretStyle') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('caretStyle')));
          let cursorStyle  = JSON.parseJsonElement(obj.getElement('$attrs').getString('caretStyle'));
          expect(cursorStyle.getString('width')).assertEqual("2.00vp");
          console.info('ArkUX_Stage_TextInput_CaretWidth_static_1100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_CaretWidth_static_1100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    /**
     * @tc.number   ArkUX_Stage_TextInput_CaretWidth_static_1200
     * @tc.name     ArkUX_Stage_TextInput_CaretWidth_static_1200
     * @tc.desc     ArkUX_Stage_TextInput_CaretWidth_static_1200
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_TextInput_CaretWidth_static_1200', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_TextInput_CaretWidth_static_1200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_CaretWidth_static_1200');
          console.info('ArkUX_Stage_TextInput_CaretWidth_static_1200 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_TextInput_CaretWidth_static_1200 component obj.getElement('$attrs').getString('caretStyle') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('caretStyle')));
          let cursorStyle  = JSON.parseJsonElement(obj.getElement('$attrs').getString('caretStyle'));
          expect(cursorStyle.getString('width')).assertEqual("7.00lpx");
          console.info('ArkUX_Stage_TextInput_CaretWidth_static_1200 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_CaretWidth_static_1200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    /**
     * @tc.number   ArkUX_Stage_TextInput_selectedColor_static_0100
     * @tc.name     ArkUX_Stage_TextInput_selectedColor_static_0100
     * @tc.desc     ArkUX_Stage_TextInput_selectedColor_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_TextInput_selectedColor_static_0100', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_TextInput_selectedColor_static_0100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_selectedColor_static_0100');
          console.info('ArkUX_Stage_TextInput_selectedColor_static_0100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_TextInput_selectedColor_static_0100 component obj.getElement('$attrs').getString('selectedBackgroundColor') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('selectedBackgroundColor')));
          expect(obj.getElement('$attrs').getString('selectedBackgroundColor')).assertEqual("#3300FF00");
          console.info('ArkUX_Stage_TextInput_selectedColor_static_0100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_selectedColor_static_0100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    /**
     * @tc.number   ArkUX_Stage_TextInput_selectedColor_static_0200
     * @tc.name     ArkUX_Stage_TextInput_selectedColor_static_0200
     * @tc.desc     ArkUX_Stage_TextInput_selectedColor_static_0200
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_TextInput_selectedColor_static_0200', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_TextInput_selectedColor_static_0200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_selectedColor_static_0200');
          console.info('ArkUX_Stage_TextInput_selectedColor_static_0200 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_TextInput_selectedColor_static_0200 component obj.getElement('$attrs').getString('selectedBackgroundColor') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('selectedBackgroundColor')));
          expect(obj.getElement('$attrs').getString('selectedBackgroundColor')).assertEqual("#33FD0000");
          console.info('ArkUX_Stage_TextInput_selectedColor_static_0200 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_selectedColor_static_0200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    /**
     * @tc.number   ArkUX_Stage_TextInput_selectedColor_static_0300
     * @tc.name     ArkUX_Stage_TextInput_selectedColor_static_0300
     * @tc.desc     ArkUX_Stage_TextInput_selectedColor_static_0300
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_TextInput_selectedColor_static_0300', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_TextInput_selectedColor_static_0300 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_selectedColor_static_0300');
          console.info('ArkUX_Stage_TextInput_selectedColor_static_0300 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_TextInput_selectedColor_static_0300 component obj.getElement('$attrs').getString('selectedBackgroundColor') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('selectedBackgroundColor')));
          expect(obj.getElement('$attrs').getString('selectedBackgroundColor')).assertEqual("#338A2BE2");
          console.info('ArkUX_Stage_TextInput_selectedColor_static_0300 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_selectedColor_static_0300 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    /**
     * @tc.number   ArkUX_Stage_TextInput_selectedColor_static_0400
     * @tc.name     ArkUX_Stage_TextInput_selectedColor_static_0400
     * @tc.desc     ArkUX_Stage_TextInput_selectedColor_static_0400
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_TextInput_selectedColor_static_0400', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_TextInput_selectedColor_static_0400 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_selectedColor_static_0400');
          console.info('ArkUX_Stage_TextInput_selectedColor_static_0400 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_TextInput_selectedColor_static_0400 component obj.getElement('$attrs').getString('selectedBackgroundColor') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('selectedBackgroundColor')));
          expect(obj.getElement('$attrs').getString('selectedBackgroundColor')).assertEqual("#33FFC0CB");
          console.info('ArkUX_Stage_TextInput_selectedColor_static_0400 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_selectedColor_static_0400 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    /**
     * @tc.number   ArkUX_Stage_TextInput_selectedColor_static_0500
     * @tc.name     ArkUX_Stage_TextInput_selectedColor_static_0500
     * @tc.desc     ArkUX_Stage_TextInput_selectedColor_static_0500
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_TextInput_selectedColor_static_0500', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_TextInput_selectedColor_static_0500 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_selectedColor_static_0500');
          console.info('ArkUX_Stage_TextInput_selectedColor_static_0500 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_TextInput_selectedColor_static_0500 component obj.getElement('$attrs').getString('selectedBackgroundColor') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('selectedBackgroundColor')));
          expect(obj.getElement('$attrs').getString('selectedBackgroundColor')).assertEqual("#33FD0000");
          console.info('ArkUX_Stage_TextInput_selectedColor_static_0500 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_selectedColor_static_0500 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    /**
     * @tc.number   ArkUX_Stage_TextInput_selectedColor_static_0600
     * @tc.name     ArkUX_Stage_TextInput_selectedColor_static_0600
     * @tc.desc     ArkUX_Stage_TextInput_selectedColor_static_0600
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_TextInput_selectedColor_static_0600', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_TextInput_selectedColor_static_0600 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_selectedColor_static_0600');
          console.info('ArkUX_Stage_TextInput_selectedColor_static_0600 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_TextInput_selectedColor_static_0600 component obj.getElement('$attrs').getString('selectedBackgroundColor') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('selectedBackgroundColor')));
          expect(obj.getElement('$attrs').getString('selectedBackgroundColor')).assertEqual(obj.getElement('$attrs').getString('backgroundColor'));
          console.info('ArkUX_Stage_TextInput_selectedColor_static_0600 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_selectedColor_static_0600 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    /**
     * @tc.number   ArkUX_Stage_TextInput_selectedColor_static_0700
     * @tc.name     ArkUX_Stage_TextInput_selectedColor_static_0700
     * @tc.desc     ArkUX_Stage_TextInput_selectedColor_static_0700
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_TextInput_selectedColor_static_0700', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_TextInput_selectedColor_static_0700 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_selectedColor_static_0700');
          console.info('ArkUX_Stage_TextInput_selectedColor_static_0700 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_TextInput_selectedColor_static_0700 component obj.getElement('$attrs').getString('selectedBackgroundColor') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('selectedBackgroundColor')));
          expect(obj.getElement('$attrs').getString('selectedBackgroundColor')).assertEqual(obj.getElement('$attrs').getString('backgroundColor'));
          console.info('ArkUX_Stage_TextInput_selectedColor_static_0700 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_selectedColor_static_0700 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    /**
     * @tc.number   ArkUX_Stage_TextInput_selectedColor_static_0800
     * @tc.name     ArkUX_Stage_TextInput_selectedColor_static_0800
     * @tc.desc     ArkUX_Stage_TextInput_selectedColor_static_0800
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_TextInput_selectedColor_static_0800', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_TextInput_selectedColor_static_0800 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_selectedColor_static_0800');
          console.info('ArkUX_Stage_TextInput_selectedColor_static_0800 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_TextInput_selectedColor_static_0800 component obj.getElement('$attrs').getString('selectedBackgroundColor') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('selectedBackgroundColor')));
          expect(obj.getElement('$attrs').getString('selectedBackgroundColor')).assertEqual(obj.getElement('$attrs').getString('backgroundColor'));
          console.info('ArkUX_Stage_TextInput_selectedColor_static_0800 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_selectedColor_static_0800 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    /**
     * @tc.number   ArkUX_Stage_TextInput_selectedColor_static_0900
     * @tc.name     ArkUX_Stage_TextInput_selectedColor_static_0900
     * @tc.desc     ArkUX_Stage_TextInput_selectedColor_static_0900
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_TextInput_selectedColor_static_0900', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_TextInput_selectedColor_static_0900 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_selectedColor_static_0900');
          console.info('ArkUX_Stage_TextInput_selectedColor_static_0900 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_TextInput_selectedColor_static_0900 component obj.getElement('$attrs').getString('selectedBackgroundColor') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('selectedBackgroundColor')));
          expect(obj.getElement('$attrs').getString('selectedBackgroundColor')).assertEqual("#33FD0000");
          console.info('ArkUX_Stage_TextInput_selectedColor_static_0900 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_selectedColor_static_0900 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    /**
     * @tc.number   ArkUX_Stage_TextInput_selectedColor_static_1000
     * @tc.name     ArkUX_Stage_TextInput_selectedColor_static_1000
     * @tc.desc     ArkUX_Stage_TextInput_selectedColor_static_1000
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_TextInput_selectedColor_static_1000', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_TextInput_selectedColor_static_1000 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_selectedColor_static_1000');
          console.info('ArkUX_Stage_TextInput_selectedColor_static_1000 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_TextInput_selectedColor_static_1000 component obj.getElement('$attrs').getString('selectedBackgroundColor') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('selectedBackgroundColor')));
          expect(obj.getElement('$attrs').getString('selectedBackgroundColor')).assertEqual(obj.getElement('$attrs').getString('backgroundColor'));
          console.info('ArkUX_Stage_TextInput_selectedColor_static_1000 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_selectedColor_static_1000 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    /**
     * @tc.number   ArkUX_Stage_TextInput_selectedColor_static_1100
     * @tc.name     ArkUX_Stage_TextInput_selectedColor_static_1100
     * @tc.desc     ArkUX_Stage_TextInput_selectedColor_static_1100
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_TextInput_selectedColor_static_1100', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_TextInput_selectedColor_static_1100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_selectedColor_static_1100');
          console.info('ArkUX_Stage_TextInput_selectedColor_static_1100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_TextInput_selectedColor_static_1100 component obj.getElement('$attrs').getString('selectedBackgroundColor') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('selectedBackgroundColor')));
          expect(obj.getElement('$attrs').getString('selectedBackgroundColor')).assertEqual("#3300FF00");
          console.info('ArkUX_Stage_TextInput_selectedColor_static_1100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_selectedColor_static_1100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    /**
     * @tc.number   ArkUX_Stage_TextInput_selectedColor_static_1200
     * @tc.name     ArkUX_Stage_TextInput_selectedColor_static_1200
     * @tc.desc     ArkUX_Stage_TextInput_selectedColor_static_1200
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_TextInput_selectedColor_static_1200', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_TextInput_selectedColor_static_1200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_selectedColor_static_1200');
          console.info('ArkUX_Stage_TextInput_selectedColor_static_1200 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_TextInput_selectedColor_static_1200 component obj.getElement('$attrs').getString('selectedBackgroundColor') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('selectedBackgroundColor')));
          console.info("ArkUX_Stage_TextInput_selectedColor_static_1200 component obj.getElement('$attrs').getString('caretPosition') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('caretPosition')));
          console.info("ArkUX_Stage_TextInput_selectedColor_static_1200 component obj.getElement('$attrs').getString('caretStyle') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('caretStyle')));
          let cursorStyle  = JSON.parseJsonElement(obj.getElement('$attrs').getString('caretStyle'));
          expect(obj.getElement('$attrs').getString('selectedBackgroundColor')).assertEqual("#3300FF00");
          expect(obj.getElement('$attrs').getString('caretPosition')).assertEqual("4");
          expect(cursorStyle.getString('width')).assertEqual("7.00vp");
          console.info('ArkUX_Stage_TextInput_selectedColor_static_1200 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_selectedColor_static_1200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    /**
     * @tc.number   ArkUX_Stage_TextInput_selectedColor_static_1300
     * @tc.name     ArkUX_Stage_TextInput_selectedColor_static_1300
     * @tc.desc     ArkUX_Stage_TextInput_selectedColor_static_1300
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_TextInput_selectedColor_static_1300', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_TextInput_selectedColor_static_1300 START');
      setTimeout(() => {
        try {
          let str = "input your word..."
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_selectedColor_static_1300');
          console.info('ArkUX_Stage_TextInput_selectedColor_static_1300 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_TextInput_selectedColor_static_1300 component obj.getElement('$attrs').getString('selectedBackgroundColor') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('selectedBackgroundColor')));
          console.info("ArkUX_Stage_TextInput_selectedColor_static_1300 component obj.getElement('$attrs').getString('caretPosition') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('caretPosition')));
          console.info("ArkUX_Stage_TextInput_selectedColor_static_1300 component obj.getElement('$attrs').getString('caretStyle') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('caretStyle')));
          let cursorStyle  = JSON.parseJsonElement(obj.getElement('$attrs').getString('caretStyle'));
          expect(obj.getElement('$attrs').getString('selectedBackgroundColor')).assertEqual(obj.getElement('$attrs').getString('backgroundColor'));
          expect(obj.getElement('$attrs').getString('caretPosition')).assertEqual("18");
          expect(cursorStyle.getString('width')).assertEqual("2.00vp");
          console.info('ArkUX_Stage_TextInput_selectedColor_static_1300 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_selectedColor_static_1300 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
  })
}
