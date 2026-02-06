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
import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import { $r } from '@ohos.arkui.component'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import router from '@ohos.router';
// import { resourceManager } from '@kit.LocalizationKit';
// import { BusinessError } from '@kit.BasicServicesKit';
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

export default function textSpanFontTest() {
  describe('textSpanFontTest', () => {
    beforeAll(() => {
      console.info("textSpanFontTest beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("textSpanFontTest beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/text/textSpanFont',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        // routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get textSpanFontTest state pages:" + JSON.stringify(pages));
        if (!("textSpanFont" == pages.name)) {
          console.info("get textSpanFontTest pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push textSpanFontTest page error:" + err);
      }
      console.info("textSpanFontTest beforeEach end");
    });


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
     * @tc.number   ArkUX_Stage_Text_Font_FontWeight_static_0100
     * @tc.name     ArkUX_Stage_Text_Font_FontWeight_static_0100
     * @tc.desc     ArkUX_Stage_Text_Font_FontWeight_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Text_Font_FontWeight_static_0100', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Text_Font_FontWeight_static_0100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_Font_FontWeight_static_0100');
          console.info('ArkUX_Stage_Text_Font_FontWeight_static_0100 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_Stage_Text_Font_FontWeight_static_0100 obj.getElement('$attrs').getString('font') is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')));
          console.info("ArkUX_Stage_Text_Font_FontWeight_static_0100 font is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('weight')).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Text_Font_FontWeight_static_0100 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontWeight_static_0100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_Text_Font_FontWeight_static_0200
     * @tc.name     ArkUX_Stage_Text_Font_FontWeight_static_0200
     * @tc.desc     ArkUX_Stage_Text_Font_FontWeight_static_0200
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Text_Font_FontWeight_static_0200', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Text_Font_FontWeight_static_0200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_Font_FontWeight_static_0200');
          console.info('ArkUX_Stage_Text_Font_FontWeight_static_0200 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Text_Font_FontWeight_static_0200 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Text_Font_FontWeight_static_0200 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('weight')).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Text_Font_FontWeight_static_0200 END ');
        } catch (err) {
          console.info('ArkUX_Stage_Text_Font_FontWeight_static_0200 ERR  ' + JSON.stringify(err));
          expect().assertFail()
        }
        done();
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_Text_Font_FontWeight_static_0300
     * @tc.name     ArkUX_Stage_Text_Font_FontWeight_static_0300
     * @tc.desc     ArkUX_Stage_Text_Font_FontWeight_static_0300
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Text_Font_FontWeight_static_0300', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Text_Font_FontWeight_static_0300 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_Font_FontWeight_static_0300');
          console.info('ArkUX_Stage_Text_Font_FontWeight_static_0300 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Text_Font_FontWeight_static_0300 JSON.parseJsonElement(strJson).getElement('$attrs').getString('JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) ')is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Text_Font_FontWeight_static_0300 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('weight')).assertEqual("100");
          console.info('ArkUX_Stage_Text_Font_FontWeight_static_0300 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontWeight_static_0300 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_Text_Font_FontWeight_static_0400
     * @tc.name     ArkUX_Stage_Text_Font_FontWeight_static_0400
     * @tc.desc     ArkUX_Stage_Text_Font_FontWeight_static_0400
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Text_Font_FontWeight_static_0400', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Text_Font_FontWeight_static_0400 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_Font_FontWeight_static_0400');
          console.info('ArkUX_Stage_Text_Font_FontWeight_static_0400 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Text_Font_FontWeight_static_0400 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Text_Font_FontWeight_static_0400 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('weight')).assertEqual("900");
          console.info('ArkUX_Stage_Text_Font_FontWeight_static_0400 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontWeight_static_0400 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number   ArkUX_Stage_Text_Font_FontWeight_static_0500
     * @tc.name     ArkUX_Stage_Text_Font_FontWeight_static_0500
     * @tc.desc     ArkUX_Stage_Text_Font_FontWeight_static_0500
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Text_Font_FontWeight_static_0500', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Text_Font_FontWeight_static_0500 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_Font_FontWeight_static_0500');
          console.info('ArkUX_Stage_Text_Font_FontWeight_static_0500 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Text_Font_FontWeight_static_0500 JSON.parseJsonElement(strJson).getElement('$attrs').getString('JSON.parseJsonElement(JSON.parseJsonElement(strJson)').getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Text_Font_FontWeight_static_0500 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('weight')).assertEqual("700");
          console.info('ArkUX_Stage_Text_Font_FontWeight_static_0500 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontWeight_static_0500 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number   ArkUX_Stage_Text_Font_FontWeight_static_0600
     * @tc.name     ArkUX_Stage_Text_Font_FontWeight_static_0600
     * @tc.desc     ArkUX_Stage_Text_Font_FontWeight_static_0600
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Text_Font_FontWeight_static_0600', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Text_Font_FontWeight_static_0600 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_Font_FontWeight_static_0600');
          console.info('ArkUX_Stage_Text_Font_FontWeight_static_0600 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Text_Font_FontWeight_static_0600 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Text_Font_FontWeight_static_0600 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('weight')).assertEqual("FontWeight.Bolder");
          console.info('ArkUX_Stage_Text_Font_FontWeight_static_0600 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontWeight_static_0600 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number   ArkUX_Stage_Text_Font_FontWeight_static_0700
     * @tc.name     ArkUX_Stage_Text_Font_FontWeight_static_0700
     * @tc.desc     ArkUX_Stage_Text_Font_FontWeight_static_0700
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Text_Font_FontWeight_static_0700', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Text_Font_FontWeight_static_0700 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_Font_FontWeight_static_0700');
          console.info('ArkUX_Stage_Text_Font_FontWeight_static_0700 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Text_Font_FontWeight_static_0700 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Text_Font_FontWeight_static_0700 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('weight')).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Text_Font_FontWeight_static_0700 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontWeight_static_0700 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number   ArkUX_Stage_Text_Font_FontWeight_static_0800
     * @tc.name     ArkUX_Stage_Text_Font_FontWeight_static_0800
     * @tc.desc     ArkUX_Stage_Text_Font_FontWeight_static_0800
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Text_Font_FontWeight_static_0800', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Text_Font_FontWeight_static_0800 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_Font_FontWeight_static_0800');
          console.info('ArkUX_Stage_Text_Font_FontWeight_static_0800 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Text_Font_FontWeight_static_0800 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Text_Font_FontWeight_static_0800 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('weight')).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Text_Font_FontWeight_static_0800 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontWeight_static_0800 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number   ArkUX_Stage_Text_Font_FontWeight_static_0900
     * @tc.name     ArkUX_Stage_Text_Font_FontWeight_static_0900
     * @tc.desc     ArkUX_Stage_Text_Font_FontWeight_static_0900
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Text_Font_FontWeight_static_0900', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Text_Font_FontWeight_static_0900 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_Font_FontWeight_static_0900');
          console.info('ArkUX_Stage_Text_Font_FontWeight_static_0900 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Text_Font_FontWeight_static_0900 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Text_Font_FontWeight_static_0900 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('weight')).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Text_Font_FontWeight_static_0900 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontWeight_static_0900 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number   ArkUX_Stage_Text_Font_FontWeight_static_1000
     * @tc.name     ArkUX_Stage_Text_Font_FontWeight_static_1000
     * @tc.desc     ArkUX_Stage_Text_Font_FontWeight_static_1000
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Text_Font_FontWeight_static_1000', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Text_Font_FontWeight_static_1000 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_Font_FontWeight_static_1000');
          console.info('ArkUX_Stage_Text_Font_FontWeight_static_1000 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Text_Font_FontWeight_static_1000 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Text_Font_FontWeight_static_1000 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('weight')).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Text_Font_FontWeight_static_1000 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontWeight_static_1000 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number   ArkUX_Stage_Text_Font_FontWeight_static_1100
     * @tc.name     ArkUX_Stage_Text_Font_FontWeight_static_1100
     * @tc.desc     ArkUX_Stage_Text_Font_FontWeight_static_1100
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Text_Font_FontWeight_static_1100', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Text_Font_FontWeight_static_1100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_Font_FontWeight_static_1100');
          console.info('ArkUX_Stage_Text_Font_FontWeight_static_1100 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Text_Font_FontWeight_static_1100 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Text_Font_FontWeight_static_1100 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('weight')).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Text_Font_FontWeight_static_1100 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontWeight_static_1100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number   ArkUX_Stage_Text_Font_FontWeight_static_1200
     * @tc.name     ArkUX_Stage_Text_Font_FontWeight_static_1200
     * @tc.desc     ArkUX_Stage_Text_Font_FontWeight_static_1200
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Text_Font_FontWeight_static_1200', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Text_Font_FontWeight_static_1200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_Font_FontWeight_static_1200');
          console.info('ArkUX_Stage_Text_Font_FontWeight_static_1200 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Text_Font_FontWeight_static_1200 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Text_Font_FontWeight_static_1200 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('weight')).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Text_Font_FontWeight_static_1200 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontWeight_static_1200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number   ArkUX_Stage_Span_Font_FontWeight_static_0100
     * @tc.name     ArkUX_Stage_Span_Font_FontWeight_static_0100
     * @tc.desc     ArkUX_Stage_Span_Font_FontWeight_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Span_Font_FontWeight_static_0100', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Span_Font_FontWeight_static_0100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Span_Font_FontWeight_static_0100');
          console.info('ArkUX_Stage_Span_Font_FontWeight_static_0100 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Span_Font_FontWeight_static_0100 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Span_Font_FontWeight_static_0100 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('weight')).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Span_Font_FontWeight_static_0100 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontWeight_static_0100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number   ArkUX_Stage_Span_Font_FontWeight_static_0200
     * @tc.name     ArkUX_Stage_Span_Font_FontWeight_static_0200
     * @tc.desc     ArkUX_Stage_Span_Font_FontWeight_static_0200
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Span_Font_FontWeight_static_0200', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Span_Font_FontWeight_static_0200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Span_Font_FontWeight_static_0200');
          console.info('ArkUX_Stage_Span_Font_FontWeight_static_0200 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Span_Font_FontWeight_static_0200 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Span_Font_FontWeight_static_0200 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('weight')).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Span_Font_FontWeight_static_0200 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontWeight_static_0200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number   ArkUX_Stage_Span_Font_FontWeight_static_0300
     * @tc.name     ArkUX_Stage_Span_Font_FontWeight_static_0300
     * @tc.desc     ArkUX_Stage_Span_Font_FontWeight_static_0300
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Span_Font_FontWeight_static_0300', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Span_Font_FontWeight_static_0300 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Span_Font_FontWeight_static_0300');
          console.info('ArkUX_Stage_Span_Font_FontWeight_static_0300 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Span_Font_FontWeight_static_0300 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Span_Font_FontWeight_static_0300 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('weight')).assertEqual("100");
          console.info('ArkUX_Stage_Span_Font_FontWeight_static_0300 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontWeight_static_0300 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number   ArkUX_Stage_Span_Font_FontWeight_static_0400
     * @tc.name     ArkUX_Stage_Span_Font_FontWeight_static_0400
     * @tc.desc     ArkUX_Stage_Span_Font_FontWeight_static_0400
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Span_Font_FontWeight_static_0400', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Span_Font_FontWeight_static_0400 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Span_Font_FontWeight_static_0400');
          console.info('ArkUX_Stage_Span_Font_FontWeight_static_0400 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Span_Font_FontWeight_static_0400 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Span_Font_FontWeight_static_0400 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('weight')).assertEqual("900");
          console.info('ArkUX_Stage_Span_Font_FontWeight_static_0400 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontWeight_static_0400 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number   ArkUX_Stage_Span_Font_FontWeight_static_0500
     * @tc.name     ArkUX_Stage_Span_Font_FontWeight_static_0500
     * @tc.desc     ArkUX_Stage_Span_Font_FontWeight_static_0500
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Span_Font_FontWeight_static_0500', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Span_Font_FontWeight_static_0500 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Span_Font_FontWeight_static_0500');
          console.info('ArkUX_Stage_Span_Font_FontWeight_static_0500 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Span_Font_FontWeight_static_0500 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Span_Font_FontWeight_static_0500 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('weight')).assertEqual("700");
          console.info('ArkUX_Stage_Span_Font_FontWeight_static_0500 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontWeight_static_0500 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number   ArkUX_Stage_Span_Font_FontWeight_static_0600
     * @tc.name     ArkUX_Stage_Span_Font_FontWeight_static_0600
     * @tc.desc     ArkUX_Stage_Span_Font_FontWeight_static_0600
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Span_Font_FontWeight_static_0600', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Span_Font_FontWeight_static_0600 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Span_Font_FontWeight_static_0600');
          console.info('ArkUX_Stage_Span_Font_FontWeight_static_0600 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Span_Font_FontWeight_static_0600 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Span_Font_FontWeight_static_0600 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('weight')).assertEqual("FontWeight.Bolder");
          console.info('ArkUX_Stage_Span_Font_FontWeight_static_0600 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontWeight_static_0600 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number   ArkUX_Stage_Span_Font_FontWeight_static_0700
     * @tc.name     ArkUX_Stage_Span_Font_FontWeight_static_0700
     * @tc.desc     ArkUX_Stage_Span_Font_FontWeight_static_0700
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Span_Font_FontWeight_static_0700', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Span_Font_FontWeight_static_0700 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Span_Font_FontWeight_static_0700');
          console.info('ArkUX_Stage_Span_Font_FontWeight_static_0700 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Span_Font_FontWeight_static_0700 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Span_Font_FontWeight_static_0700 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('weight')).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Span_Font_FontWeight_static_0700 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontWeight_static_0700 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number   ArkUX_Stage_Span_Font_FontWeight_static_0800
     * @tc.name     ArkUX_Stage_Span_Font_FontWeight_static_0800
     * @tc.desc     ArkUX_Stage_Span_Font_FontWeight_static_0800
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Span_Font_FontWeight_static_0800', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Span_Font_FontWeight_static_0800 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Span_Font_FontWeight_static_0800');
          console.info('ArkUX_Stage_Span_Font_FontWeight_static_0800 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Span_Font_FontWeight_static_0800 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Span_Font_FontWeight_static_0800 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('weight')).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Span_Font_FontWeight_static_0800 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontWeight_static_0800 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number   ArkUX_Stage_Span_Font_FontWeight_static_0900
     * @tc.name     ArkUX_Stage_Span_Font_FontWeight_static_0900
     * @tc.desc     ArkUX_Stage_Span_Font_FontWeight_static_0900
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Span_Font_FontWeight_static_0900', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Span_Font_FontWeight_static_0900 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Span_Font_FontWeight_static_0900');
          console.info('ArkUX_Stage_Span_Font_FontWeight_static_0900 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Span_Font_FontWeight_static_0900 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Span_Font_FontWeight_static_0900 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('weight')).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Span_Font_FontWeight_static_0900 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontWeight_static_0900 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number   ArkUX_Stage_Span_Font_FontWeight_static_1000
     * @tc.name     ArkUX_Stage_Span_Font_FontWeight_static_1000
     * @tc.desc     ArkUX_Stage_Span_Font_FontWeight_static_1000
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Span_Font_FontWeight_static_1000', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Span_Font_FontWeight_static_1000 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Span_Font_FontWeight_static_1000');
          console.info('ArkUX_Stage_Span_Font_FontWeight_static_1000 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Span_Font_FontWeight_static_1000 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Span_Font_FontWeight_static_1000 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('weight')).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Span_Font_FontWeight_static_1000 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontWeight_static_1000 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number   ArkUX_Stage_Span_Font_FontWeight_static_1100
     * @tc.name     ArkUX_Stage_Span_Font_FontWeight_static_1100
     * @tc.desc     ArkUX_Stage_Span_Font_FontWeight_static_1100
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Span_Font_FontWeight_static_1100', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Span_Font_FontWeight_static_1100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Span_Font_FontWeight_static_1100');
          console.info('ArkUX_Stage_Span_Font_FontWeight_static_1100 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Span_Font_FontWeight_static_1100 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Span_Font_FontWeight_static_1100 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('weight')).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Span_Font_FontWeight_static_1100 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontWeight_static_1100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number   ArkUX_Stage_Span_Font_FontWeight_static_1200
     * @tc.name     ArkUX_Stage_Span_Font_FontWeight_static_1200
     * @tc.desc     ArkUX_Stage_Span_Font_FontWeight_static_1200
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Span_Font_FontWeight_static_1200', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Span_Font_FontWeight_static_1200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Span_Font_FontWeight_static_1200');
          console.info('ArkUX_Stage_Span_Font_FontWeight_static_1200 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Span_Font_FontWeight_static_1200 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Span_Font_FontWeight_static_1200 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('weight')).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Span_Font_FontWeight_static_1200 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontWeight_static_1200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number   ArkUX_Stage_Text_Font_FontSize_static_0100
     * @tc.name     ArkUX_Stage_Text_Font_FontSize_static_0100
     * @tc.desc     ArkUX_Stage_Text_Font_FontSize_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Text_Font_FontSize_static_0100', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Text_Font_FontSize_static_0100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_Font_FontSize_static_0100');
          console.info('ArkUX_Stage_Text_Font_FontSize_static_0100 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Text_Font_FontSize_static_0100 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Text_Font_FontSize_static_0100 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('size')).assertEqual("0.00px");
          console.info('ArkUX_Stage_Text_Font_FontSize_static_0100 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontSize_static_0100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number   ArkUX_Stage_Text_Font_FontSize_static_0200
     * @tc.name     ArkUX_Stage_Text_Font_FontSize_static_0200
     * @tc.desc     ArkUX_Stage_Text_Font_FontSize_static_0200
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Text_Font_FontSize_static_0200', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Text_Font_FontSize_static_0200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_Font_FontSize_static_0200');
          console.info('ArkUX_Stage_Text_Font_FontSize_static_0200 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Text_Font_FontSize_static_0200 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Text_Font_FontSize_static_0200 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('size')).assertEqual("16.00fp");
          console.info('ArkUX_Stage_Text_Font_FontSize_static_0200 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontSize_static_0200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number   ArkUX_Stage_Text_Font_FontSize_static_0300
     * @tc.name     ArkUX_Stage_Text_Font_FontSize_static_0300
     * @tc.desc     ArkUX_Stage_Text_Font_FontSize_static_0300
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Text_Font_FontSize_static_0300', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Text_Font_FontSize_static_0300 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_Font_FontSize_static_0300');
          console.info('ArkUX_Stage_Text_Font_FontSize_static_0300 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Text_Font_FontSize_static_0300 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Text_Font_FontSize_static_0300 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('size')).assertEqual("30.00px");
          console.info('ArkUX_Stage_Text_Font_FontSize_static_0300 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontSize_static_0300 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number   ArkUX_Stage_Text_Font_FontSize_static_0400
     * @tc.name     ArkUX_Stage_Text_Font_FontSize_static_0400
     * @tc.desc     ArkUX_Stage_Text_Font_FontSize_static_0400
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Text_Font_FontSize_static_0400', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Text_Font_FontSize_static_0400 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_Font_FontSize_static_0400');
          console.info('ArkUX_Stage_Text_Font_FontSize_static_0400 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Text_Font_FontSize_static_0400 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Text_Font_FontSize_static_0400 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('size')).assertEqual("30.00vp");
          console.info('ArkUX_Stage_Text_Font_FontSize_static_0400 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontSize_static_0400 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number   ArkUX_Stage_Text_Font_FontSize_static_0500
     * @tc.name     ArkUX_Stage_Text_Font_FontSize_static_0500
     * @tc.desc     ArkUX_Stage_Text_Font_FontSize_static_0500
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Text_Font_FontSize_static_0500', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Text_Font_FontSize_static_0500 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_Font_FontSize_static_0500');
          console.info('ArkUX_Stage_Text_Font_FontSize_static_0500 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Text_Font_FontSize_static_0500 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Text_Font_FontSize_static_0500 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('size')).assertEqual("30.00lpx");
          console.info('ArkUX_Stage_Text_Font_FontSize_static_0500 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontSize_static_0500 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number   ArkUX_Stage_Text_Font_FontSize_static_0600
     * @tc.name     ArkUX_Stage_Text_Font_FontSize_static_0600
     * @tc.desc     ArkUX_Stage_Text_Font_FontSize_static_0600
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Text_Font_FontSize_static_0600', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Text_Font_FontSize_static_0600 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_Font_FontSize_static_0600');
          console.info('ArkUX_Stage_Text_Font_FontSize_static_0600 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Text_Font_FontSize_static_0600 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Text_Font_FontSize_static_0600 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          const uiContext = AppStorage.get<UIContext>('uiContext');
          const context = AppStorage.get<UIContext>('uiContext')!.getHostContext();
          let resourceSize = context?.resourceManager.getDouble($r('sys.float.ohos_id_text_font_size').id) as double
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('size')).assertEqual(uiContext!.px2fp(resourceSize)+'.00fp');
          console.info('ArkUX_Stage_Text_Font_FontSize_static_0600 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontSize_static_0600 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number   ArkUX_Stage_Text_Font_FontSize_static_0700
     * @tc.name     ArkUX_Stage_Text_Font_FontSize_static_0700
     * @tc.desc     ArkUX_Stage_Text_Font_FontSize_static_0700
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Text_Font_FontSize_static_0700', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Text_Font_FontSize_static_0700 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_Font_FontSize_static_0700');
          console.info('ArkUX_Stage_Text_Font_FontSize_static_0700 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Text_Font_FontSize_static_0700 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Text_Font_FontSize_static_0700 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          const uiContext = AppStorage.get<UIContext>('uiContext');
          const context = AppStorage.get<UIContext>('uiContext')!.getHostContext();
          let resourceSize = context?.resourceManager.getDouble($r('sys.float.ohos_id_text_font_size').id) as double
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('size')).assertEqual(uiContext!.px2fp(resourceSize)+'.00fp');
          console.info('ArkUX_Stage_Text_Font_FontSize_static_0700 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontSize_static_0700 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number   ArkUX_Stage_Text_Font_FontSize_static_0800
     * @tc.name     ArkUX_Stage_Text_Font_FontSize_static_0800
     * @tc.desc     ArkUX_Stage_Text_Font_FontSize_static_0800
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Text_Font_FontSize_static_0800', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Text_Font_FontSize_static_0800 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_Font_FontSize_static_0800');
          console.info('ArkUX_Stage_Text_Font_FontSize_static_0800 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Text_Font_FontSize_static_0800 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Text_Font_FontSize_static_0800 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          const uiContext = AppStorage.get<UIContext>('uiContext');
          const context = AppStorage.get<UIContext>('uiContext')!.getHostContext();
          // let resourceSize = context?.resourceManager.getDouble($r('sys.float.ohos_id_text_font_size').id) as double
          // expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('size')).assertEqual(uiContext!.px2fp(resourceSize)+'.00fp');
          console.info('ArkUX_Stage_Text_Font_FontSize_static_0800 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontSize_static_0800 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number   ArkUX_Stage_Text_Font_FontSize_static_0900
     * @tc.name     ArkUX_Stage_Text_Font_FontSize_static_0900
     * @tc.desc     ArkUX_Stage_Text_Font_FontSize_static_0900
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Text_Font_FontSize_static_0900', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Text_Font_FontSize_static_0900 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_Font_FontSize_static_0900');
          console.info('ArkUX_Stage_Text_Font_FontSize_static_0900 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Text_Font_FontSize_static_0900 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Text_Font_FontSize_static_0900 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          const uiContext = AppStorage.get<UIContext>('uiContext');
          const context = AppStorage.get<UIContext>('uiContext')!.getHostContext();
          // let resourceSize = context?.resourceManager.getDouble($r('sys.float.ohos_id_text_font_size').id) as double
          // expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('size')).assertEqual(uiContext!.px2fp(resourceSize)+'.00fp');
          console.info('ArkUX_Stage_Text_Font_FontSize_static_0900 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontSize_static_0900 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number   ArkUX_Stage_Text_Font_FontSize_static_1000
     * @tc.name     ArkUX_Stage_Text_Font_FontSize_static_1000
     * @tc.desc     ArkUX_Stage_Text_Font_FontSize_static_1000
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Text_Font_FontSize_static_1000', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Text_Font_FontSize_static_1000 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_Font_FontSize_static_1000');
          console.info('ArkUX_Stage_Text_Font_FontSize_static_1000 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Text_Font_FontSize_static_1000 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Text_Font_FontSize_static_1000 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('size')).assertEqual("20.00fp");
          console.info('ArkUX_Stage_Text_Font_FontSize_static_1000 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontSize_static_1000 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number   ArkUX_Stage_Span_Font_FontSize_static_0100
     * @tc.name     ArkUX_Stage_Span_Font_FontSize_static_0100
     * @tc.desc     ArkUX_Stage_Span_Font_FontSize_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Span_Font_FontSize_static_0100', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Span_Font_FontSize_static_0100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Span_Font_FontSize_static_0100');
          console.info('ArkUX_Stage_Span_Font_FontSize_static_0100 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Span_Font_FontSize_static_0100 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Span_Font_FontSize_static_0100 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('size')).assertEqual("0.00fp");
          console.info('ArkUX_Stage_Span_Font_FontSize_static_0100 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontSize_static_0100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number   ArkUX_Stage_Span_Font_FontSize_static_0200
     * @tc.name     ArkUX_Stage_Span_Font_FontSize_static_0200
     * @tc.desc     ArkUX_Stage_Span_Font_FontSize_static_0200
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Span_Font_FontSize_static_0200', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Span_Font_FontSize_static_0200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Span_Font_FontSize_static_0200');
          console.info('ArkUX_Stage_Span_Font_FontSize_static_0200 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Span_Font_FontSize_static_0200 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Span_Font_FontSize_static_0200 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('size')).assertEqual("16.00fp");
          console.info('ArkUX_Stage_Span_Font_FontSize_static_0200 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontSize_static_0200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number   ArkUX_Stage_Span_Font_FontSize_static_0300
     * @tc.name     ArkUX_Stage_Span_Font_FontSize_static_0300
     * @tc.desc     ArkUX_Stage_Span_Font_FontSize_static_0300
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Span_Font_FontSize_static_0300', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Span_Font_FontSize_static_0300 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Span_Font_FontSize_static_0300');
          console.info('ArkUX_Stage_Span_Font_FontSize_static_0300 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Span_Font_FontSize_static_0300 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Span_Font_FontSize_static_0300 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('size')).assertEqual("30.00px");
          console.info('ArkUX_Stage_Span_Font_FontSize_static_0300 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontSize_static_0300 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number   ArkUX_Stage_Span_Font_FontSize_static_0400
     * @tc.name     ArkUX_Stage_Span_Font_FontSize_static_0400
     * @tc.desc     ArkUX_Stage_Span_Font_FontSize_static_0400
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Span_Font_FontSize_static_0400', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Span_Font_FontSize_static_0400 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Span_Font_FontSize_static_0400');
          console.info('ArkUX_Stage_Span_Font_FontSize_static_0400 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Span_Font_FontSize_static_0400 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Span_Font_FontSize_static_0400 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('size')).assertEqual("30.00vp");
          console.info('ArkUX_Stage_Span_Font_FontSize_static_0400 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontSize_static_0400 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number   ArkUX_Stage_Span_Font_FontSize_static_0500
     * @tc.name     ArkUX_Stage_Span_Font_FontSize_static_0500
     * @tc.desc     ArkUX_Stage_Span_Font_FontSize_static_0500
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Span_Font_FontSize_static_0500', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Span_Font_FontSize_static_0500 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Span_Font_FontSize_static_0500');
          console.info('ArkUX_Stage_Span_Font_FontSize_static_0500 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Span_Font_FontSize_static_0500 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Span_Font_FontSize_static_0500 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('size')).assertEqual("30.00lpx");
          console.info('ArkUX_Stage_Span_Font_FontSize_static_0500 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontSize_static_0500 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number   ArkUX_Stage_Span_Font_FontSize_static_0600
     * @tc.name     ArkUX_Stage_Span_Font_FontSize_static_0600
     * @tc.desc     ArkUX_Stage_Span_Font_FontSize_static_0600
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Span_Font_FontSize_static_0600', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Span_Font_FontSize_static_0600 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Span_Font_FontSize_static_0600');
          console.info('ArkUX_Stage_Span_Font_FontSize_static_0600 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Span_Font_FontSize_static_0600 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Span_Font_FontSize_static_0600 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          const uiContext = AppStorage.get<UIContext>('uiContext');
          const context = AppStorage.get<UIContext>('uiContext')!.getHostContext();
          let resourceSize = context?.resourceManager.getDouble($r('sys.float.ohos_id_text_font_size').id) as double
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('size')).assertEqual(uiContext!.px2fp(resourceSize)+'.00fp');
          console.info('ArkUX_Stage_Span_Font_FontSize_static_0600 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontSize_static_0600 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number   ArkUX_Stage_Span_Font_FontSize_static_0700
     * @tc.name     ArkUX_Stage_Span_Font_FontSize_static_0700
     * @tc.desc     ArkUX_Stage_Span_Font_FontSize_static_0700
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Span_Font_FontSize_static_0700', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Span_Font_FontSize_static_0700 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Span_Font_FontSize_static_0700');
          console.info('ArkUX_Stage_Span_Font_FontSize_static_0700 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Span_Font_FontSize_static_0700 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Span_Font_FontSize_static_0700 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          // expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('size')).assertEqual(uiContext.px2fp(resourceSize)+'.00fp');
          console.info('ArkUX_Stage_Span_Font_FontSize_static_0700 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontSize_static_0700 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number   ArkUX_Stage_Span_Font_FontSize_static_0800
     * @tc.name     ArkUX_Stage_Span_Font_FontSize_static_0800
     * @tc.desc     ArkUX_Stage_Span_Font_FontSize_static_0800
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Span_Font_FontSize_static_0800', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Span_Font_FontSize_static_0800 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Span_Font_FontSize_static_0800');
          console.info('ArkUX_Stage_Span_Font_FontSize_static_0800 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Span_Font_FontSize_static_0800 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Span_Font_FontSize_static_0800 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          const uiContext = AppStorage.get<UIContext>('uiContext');
          const context = AppStorage.get<UIContext>('uiContext')!.getHostContext();
          let resourceSize = context?.resourceManager.getDouble($r('sys.float.ohos_id_text_font_size').id) as double
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('size')).assertEqual(uiContext!.px2fp(resourceSize)+'.00fp');
          console.info('ArkUX_Stage_Span_Font_FontSize_static_0800 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontSize_static_0800 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number   ArkUX_Stage_Span_Font_FontSize_static_0900
     * @tc.name     ArkUX_Stage_Span_Font_FontSize_static_0900
     * @tc.desc     ArkUX_Stage_Span_Font_FontSize_static_0900
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Span_Font_FontSize_static_0900', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Span_Font_FontSize_static_0900 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Span_Font_FontSize_static_0900');
          console.info('ArkUX_Stage_Span_Font_FontSize_static_0900 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Span_Font_FontSize_static_0900 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Span_Font_FontSize_static_0900 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          const uiContext = AppStorage.get<UIContext>('uiContext');
          const context = AppStorage.get<UIContext>('uiContext')!.getHostContext();
          let resourceSize = context?.resourceManager.getDouble($r('sys.float.ohos_id_text_font_size').id) as double
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('size')).assertEqual(uiContext!.px2fp(resourceSize)+'.00fp');
          console.info('ArkUX_Stage_Span_Font_FontSize_static_0900 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontSize_static_0900 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    // /*
    //  * @tc.number   ArkUX_Stage_Span_Font_FontSize_static_1000
    //  * @tc.name     ArkUX_Stage_Span_Font_FontSize_static_1000
    //  * @tc.desc     ArkUX_Stage_Span_Font_FontSize_static_1000
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('ArkUX_Stage_Span_Font_FontSize_static_1000', Level.LEVEL1, async (done: ()=>void) => {
    //   console.info('ArkUX_Stage_Span_Font_FontSize_static_1000 START');
    //   setTimeout(() => {
    //     try {
    //       let strJson = inspector.getInspectorByKey('ArkUX_Stage_Span_Font_FontSize_static_1000');
    //       console.info('ArkUX_Stage_Span_Font_FontSize_static_1000 START  :' + JSON.stringify(strJson));
    //
    //       console.info("ArkUX_Stage_Span_Font_FontSize_static_1000 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
    //       JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
    //
    //       console.info("ArkUX_Stage_Span_Font_FontSize_static_1000 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
    //       JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
    //       expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('size')).assertEqual("20.00fp");
    //       console.info('ArkUX_Stage_Span_Font_FontSize_static_1000 END ');
    //     } catch (err) {
    //       expect().assertFail()
    //       console.info('ArkUX_Stage_Span_Font_FontSize_static_1000 ERR  ' + JSON.stringify(err));
    //     }
    //     done();
    //   }, 500)
    // });

    /**
     * @tc.number   ArkUX_Stage_Text_Font_FontStyle_static_0100
     * @tc.name     ArkUX_Stage_Text_Font_FontStyle_static_0100
     * @tc.desc     ArkUX_Stage_Text_Font_FontStyle_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Text_Font_FontStyle_static_0100', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Text_Font_FontStyle_static_0100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_Font_FontStyle_static_0100');
          console.info('ArkUX_Stage_Text_Font_FontStyle_static_0100 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Text_Font_FontStyle_static_0100 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Text_Font_FontStyle_static_0100 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('style')).assertEqual("FontStyle.Italic");
          console.info('ArkUX_Stage_Text_Font_FontStyle_static_0100 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontStyle_static_0100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number   ArkUX_Stage_Text_Font_FontStyle_static_0200
     * @tc.name     ArkUX_Stage_Text_Font_FontStyle_static_0200
     * @tc.desc     ArkUX_Stage_Text_Font_FontStyle_static_0200
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Text_Font_FontStyle_static_0200', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Text_Font_FontStyle_static_0200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_Font_FontStyle_static_0200');
          console.info('ArkUX_Stage_Text_Font_FontStyle_static_0200 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Text_Font_FontStyle_static_0200 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Text_Font_FontStyle_static_0200 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('style')).assertEqual("FontStyle.Normal");
          console.info('ArkUX_Stage_Text_Font_FontStyle_static_0200 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontStyle_static_0200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    // /*
    //  * @tc.number   ArkUX_Stage_Text_Font_FontStyle_static_0300
    //  * @tc.name     ArkUX_Stage_Text_Font_FontStyle_static_0300
    //  * @tc.desc     ArkUX_Stage_Text_Font_FontStyle_static_0300
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('ArkUX_Stage_Text_Font_FontStyle_static_0300', Level.LEVEL1, async (done: ()=>void) => {
    //   console.info('ArkUX_Stage_Text_Font_FontStyle_static_0300 START');
    //   setTimeout(() => {
    //     try {
    //       let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_Font_FontStyle_static_0300');
    //       console.info('ArkUX_Stage_Text_Font_FontStyle_static_0300 START  :' + JSON.stringify(strJson));
    //
    //       console.info("ArkUX_Stage_Text_Font_FontStyle_static_0300 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
    //       JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
    //
    //       console.info("ArkUX_Stage_Text_Font_FontStyle_static_0300 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
    //       JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
    //       expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('style')).assertEqual("FontStyle.Italic");
    //       console.info('ArkUX_Stage_Text_Font_FontStyle_static_0300 END ');
    //     } catch (err) {
    //       expect().assertFail()
    //       console.info('ArkUX_Stage_Text_Font_FontStyle_static_0300 ERR  ' + JSON.stringify(err));
    //     }
    //     done();
    //   }, 500)
    // });

    /**
     * @tc.number   ArkUX_Stage_Text_Font_FontStyle_static_0400
     * @tc.name     ArkUX_Stage_Text_Font_FontStyle_static_0400
     * @tc.desc     ArkUX_Stage_Text_Font_FontStyle_static_0400
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Text_Font_FontStyle_static_0400', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Text_Font_FontStyle_static_0400 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_Font_FontStyle_static_0400');
          console.info('ArkUX_Stage_Text_Font_FontStyle_static_0400 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Text_Font_FontStyle_static_0400 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Text_Font_FontStyle_static_0400 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('style')).assertEqual("FontStyle.Normal");
          console.info('ArkUX_Stage_Text_Font_FontStyle_static_0400 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontStyle_static_0400 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    // /*
    //  * @tc.number   ArkUX_Stage_Text_Font_FontStyle_static_0500
    //  * @tc.name     ArkUX_Stage_Text_Font_FontStyle_static_0500
    //  * @tc.desc     ArkUX_Stage_Text_Font_FontStyle_static_0500
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('ArkUX_Stage_Text_Font_FontStyle_static_0500', Level.LEVEL1, async (done: ()=>void) => {
    //   console.info('ArkUX_Stage_Text_Font_FontStyle_static_0500 START');
    //   setTimeout(() => {
    //     try {
    //       let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_Font_FontStyle_static_0500');
    //       console.info('ArkUX_Stage_Text_Font_FontStyle_static_0500 START  :' + JSON.stringify(strJson));
    //
    //       console.info("ArkUX_Stage_Text_Font_FontStyle_static_0500 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
    //       JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
    //
    //       console.info("ArkUX_Stage_Text_Font_FontStyle_static_0500 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
    //       JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
    //       expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('style')).assertEqual("FontStyle.Italic");
    //       console.info('ArkUX_Stage_Text_Font_FontStyle_static_0500 END ');
    //     } catch (err) {
    //       expect().assertFail()
    //       console.info('ArkUX_Stage_Text_Font_FontStyle_static_0500 ERR  ' + JSON.stringify(err));
    //     }
    //     done();
    //   }, 500)
    // });

    /**
     * @tc.number   ArkUX_Stage_Text_Font_FontStyle_static_0600
     * @tc.name     ArkUX_Stage_Text_Font_FontStyle_static_0600
     * @tc.desc     ArkUX_Stage_Text_Font_FontStyle_static_0600
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Text_Font_FontStyle_static_0600', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Text_Font_FontStyle_static_0600 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_Font_FontStyle_static_0600');
          console.info('ArkUX_Stage_Text_Font_FontStyle_static_0600 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Text_Font_FontStyle_static_0600 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Text_Font_FontStyle_static_0600 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('style')).assertEqual("FontStyle.Italic");
          console.info('ArkUX_Stage_Text_Font_FontStyle_static_0600 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontStyle_static_0600 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number   ArkUX_Stage_Span_Font_FontStyle_static_0100
     * @tc.name     ArkUX_Stage_Span_Font_FontStyle_static_0100
     * @tc.desc     ArkUX_Stage_Span_Font_FontStyle_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Span_Font_FontStyle_static_0100', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Span_Font_FontStyle_static_0100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Span_Font_FontStyle_static_0100');
          console.info('ArkUX_Stage_Span_Font_FontStyle_static_0100 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Span_Font_FontStyle_static_0100 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Span_Font_FontStyle_static_0100 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('style')).assertEqual("FontStyle.Italic");
          console.info('ArkUX_Stage_Span_Font_FontStyle_static_0100 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontStyle_static_0100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number   ArkUX_Stage_Span_Font_FontStyle_static_0200
     * @tc.name     ArkUX_Stage_Span_Font_FontStyle_static_0200
     * @tc.desc     ArkUX_Stage_Span_Font_FontStyle_static_0200
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Span_Font_FontStyle_static_0200', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Span_Font_FontStyle_static_0200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Span_Font_FontStyle_static_0200');
          console.info('ArkUX_Stage_Span_Font_FontStyle_static_0200 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Span_Font_FontStyle_static_0200 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Span_Font_FontStyle_static_0200 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('style')).assertEqual("FontStyle.Normal");
          console.info('ArkUX_Stage_Span_Font_FontStyle_static_0200 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontStyle_static_0200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    // /*
    //  * @tc.number   ArkUX_Stage_Span_Font_FontStyle_static_0300
    //  * @tc.name     ArkUX_Stage_Span_Font_FontStyle_static_0300
    //  * @tc.desc     ArkUX_Stage_Span_Font_FontStyle_static_0300
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('ArkUX_Stage_Span_Font_FontStyle_static_0300', Level.LEVEL1, async (done: ()=>void) => {
    //   console.info('ArkUX_Stage_Span_Font_FontStyle_static_0300 START');
    //   setTimeout(() => {
    //     try {
    //       let strJson = inspector.getInspectorByKey('ArkUX_Stage_Span_Font_FontStyle_static_0300');
    //       console.info('ArkUX_Stage_Span_Font_FontStyle_static_0300 START  :' + JSON.stringify(strJson));
    //
    //       console.info("ArkUX_Stage_Span_Font_FontStyle_static_0300 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
    //       JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
    //
    //       console.info("ArkUX_Stage_Span_Font_FontStyle_static_0300 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
    //       JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
    //       expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('style')).assertEqual("FontStyle.Italic");
    //       console.info('ArkUX_Stage_Span_Font_FontStyle_static_0300 END ');
    //     } catch (err) {
    //       expect().assertFail()
    //       console.info('ArkUX_Stage_Span_Font_FontStyle_static_0300 ERR  ' + JSON.stringify(err));
    //     }
    //     done();
    //   }, 500)
    // });

    /**
     * @tc.number   ArkUX_Stage_Span_Font_FontStyle_static_0400
     * @tc.name     ArkUX_Stage_Span_Font_FontStyle_static_0400
     * @tc.desc     ArkUX_Stage_Span_Font_FontStyle_static_0400
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Span_Font_FontStyle_static_0400', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Span_Font_FontStyle_static_0400 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Span_Font_FontStyle_static_0400');
          console.info('ArkUX_Stage_Span_Font_FontStyle_static_0400 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Span_Font_FontStyle_static_0400 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Span_Font_FontStyle_static_0400 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('style')).assertEqual("FontStyle.Normal");
          console.info('ArkUX_Stage_Span_Font_FontStyle_static_0400 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontStyle_static_0400 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    // /*
    //  * @tc.number   ArkUX_Stage_Span_Font_FontStyle_static_0500
    //  * @tc.name     ArkUX_Stage_Span_Font_FontStyle_static_0500
    //  * @tc.desc     ArkUX_Stage_Span_Font_FontStyle_static_0500
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('ArkUX_Stage_Span_Font_FontStyle_static_0500', Level.LEVEL1, async (done: ()=>void) => {
    //   console.info('ArkUX_Stage_Span_Font_FontStyle_static_0500 START');
    //   setTimeout(() => {
    //     try {
    //       let strJson = inspector.getInspectorByKey('ArkUX_Stage_Span_Font_FontStyle_static_0500');
    //       console.info('ArkUX_Stage_Span_Font_FontStyle_static_0500 START  :' + JSON.stringify(strJson));
    //
    //       console.info("ArkUX_Stage_Span_Font_FontStyle_static_0500 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
    //       JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
    //
    //       console.info("ArkUX_Stage_Span_Font_FontStyle_static_0500 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
    //       JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
    //       expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('style')).assertEqual("FontStyle.Italic");
    //       console.info('ArkUX_Stage_Span_Font_FontStyle_static_0500 END ');
    //     } catch (err) {
    //       expect().assertFail()
    //       console.info('ArkUX_Stage_Span_Font_FontStyle_static_0500 ERR  ' + JSON.stringify(err));
    //     }
    //     done();
    //   }, 500)
    // });

    /**
     * @tc.number   ArkUX_Stage_Span_Font_FontStyle_static_0600
     * @tc.name     ArkUX_Stage_Span_Font_FontStyle_static_0600
     * @tc.desc     ArkUX_Stage_Span_Font_FontStyle_static_0600
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Span_Font_FontStyle_static_0600', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Span_Font_FontStyle_static_0600 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Span_Font_FontStyle_static_0600');
          console.info('ArkUX_Stage_Span_Font_FontStyle_static_0600 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Span_Font_FontStyle_static_0600 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Span_Font_FontStyle_static_0600 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('style')).assertEqual("FontStyle.Italic");
          console.info('ArkUX_Stage_Span_Font_FontStyle_static_0600 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontStyle_static_0600 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number   ArkUX_Stage_Text_Font_FontFamily_static_0100
     * @tc.name     ArkUX_Stage_Text_Font_FontFamily_static_0100
     * @tc.desc     ArkUX_Stage_Text_Font_FontFamily_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Text_Font_FontFamily_static_0100', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Text_Font_FontFamily_static_0100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_Font_FontFamily_static_0100');
          console.info('ArkUX_Stage_Text_Font_FontFamily_static_0100 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Text_Font_FontFamily_static_0100 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Text_Font_FontFamily_static_0100 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('family')).assertEqual("zidingyi");
          console.info('ArkUX_Stage_Text_Font_FontFamily_static_0100 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontFamily_static_0100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number   ArkUX_Stage_Text_Font_FontFamily_static_0200
     * @tc.name     ArkUX_Stage_Text_Font_FontFamily_static_0200
     * @tc.desc     ArkUX_Stage_Text_Font_FontFamily_static_0200
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Text_Font_FontFamily_static_0200', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Text_Font_FontFamily_static_0200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_Font_FontFamily_static_0200');
          console.info('ArkUX_Stage_Text_Font_FontFamily_static_0200 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Text_Font_FontFamily_static_0200 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Text_Font_FontFamily_static_0200 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('family')).assertEqual("HarmonyOS Sans");
          console.info('ArkUX_Stage_Text_Font_FontFamily_static_0200 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontFamily_static_0200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number   ArkUX_Stage_Text_Font_FontFamily_static_0300
     * @tc.name     ArkUX_Stage_Text_Font_FontFamily_static_0300
     * @tc.desc     ArkUX_Stage_Text_Font_FontFamily_static_0300
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Text_Font_FontFamily_static_0300', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Text_Font_FontFamily_static_0300 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_Font_FontFamily_static_0300');
          console.info('ArkUX_Stage_Text_Font_FontFamily_static_0300 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Text_Font_FontFamily_static_0300 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Text_Font_FontFamily_static_0300 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('family')).assertEqual("HarmonyOS Sans");
          console.info('ArkUX_Stage_Text_Font_FontFamily_static_0300 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontFamily_static_0300 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number   ArkUX_Stage_Text_Font_FontFamily_static_0400
     * @tc.name     ArkUX_Stage_Text_Font_FontFamily_static_0400
     * @tc.desc     ArkUX_Stage_Text_Font_FontFamily_static_0400
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Text_Font_FontFamily_static_0400', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Text_Font_FontFamily_static_0400 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_Font_FontFamily_static_0400');
          console.info('ArkUX_Stage_Text_Font_FontFamily_static_0400 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Text_Font_FontFamily_static_0400 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Text_Font_FontFamily_static_0400 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('family')).assertEqual("HarmonyOS Sans");
          console.info('ArkUX_Stage_Text_Font_FontFamily_static_0400 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontFamily_static_0400 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number   ArkUX_Stage_Text_Font_FontFamily_static_0500
     * @tc.name     ArkUX_Stage_Text_Font_FontFamily_static_0500
     * @tc.desc     ArkUX_Stage_Text_Font_FontFamily_static_0500
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Text_Font_FontFamily_static_0500', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Text_Font_FontFamily_static_0500 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_Font_FontFamily_static_0500');
          console.info('ArkUX_Stage_Text_Font_FontFamily_static_0500 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Text_Font_FontFamily_static_0500 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Text_Font_FontFamily_static_0500 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('family')).assertEqual("HarmonyOS Sans");
          console.info('ArkUX_Stage_Text_Font_FontFamily_static_0500 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontFamily_static_0500 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number   ArkUX_Stage_Text_Font_FontFamily_static_0600
     * @tc.name     ArkUX_Stage_Text_Font_FontFamily_static_0600
     * @tc.desc     ArkUX_Stage_Text_Font_FontFamily_static_0600
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Text_Font_FontFamily_static_0600', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Text_Font_FontFamily_static_0600 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_Font_FontFamily_static_0600');
          console.info('ArkUX_Stage_Text_Font_FontFamily_static_0600 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Text_Font_FontFamily_static_0600 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Text_Font_FontFamily_static_0600 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('family')).assertEqual("HarmonyOS Sans");
          console.info('ArkUX_Stage_Text_Font_FontFamily_static_0600 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontFamily_static_0600 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_Text_Font_FontFamily_static_0700
     * @tc.name     ArkUX_Stage_Text_Font_FontFamily_static_0700
     * @tc.desc     ArkUX_Stage_Text_Font_FontFamily_static_0700
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Text_Font_FontFamily_static_0700', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Text_Font_FontFamily_static_0700 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Text_Font_FontFamily_static_0700');
          console.info('ArkUX_Stage_Text_Font_FontFamily_static_0700 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Text_Font_FontFamily_static_0700 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Text_Font_FontFamily_static_0700 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('family')).assertEqual("Arial, sans-serif");
          console.info('ArkUX_Stage_Text_Font_FontFamily_static_0700 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontFamily_0900 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number   ArkUX_Stage_Span_Font_FontFamily_static_0100
     * @tc.name     ArkUX_Stage_Span_Font_FontFamily_static_0100
     * @tc.desc     ArkUX_Stage_Span_Font_FontFamily_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Span_Font_FontFamily_static_0100', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Span_Font_FontFamily_static_0100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Span_Font_FontFamily_static_0100');
          console.info('ArkUX_Stage_Span_Font_FontFamily_static_0100 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Span_Font_FontFamily_static_0100 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Span_Font_FontFamily_static_0100 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('family')).assertEqual("zidingyi");
          console.info('ArkUX_Stage_Span_Font_FontFamily_static_0100 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontFamily_static_0100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number   ArkUX_Stage_Span_Font_FontFamily_static_0200
     * @tc.name     ArkUX_Stage_Span_Font_FontFamily_static_0200
     * @tc.desc     ArkUX_Stage_Span_Font_FontFamily_static_0200
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Span_Font_FontFamily_static_0200', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Span_Font_FontFamily_static_0200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Span_Font_FontFamily_static_0200');
          console.info('ArkUX_Stage_Span_Font_FontFamily_static_0200 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Span_Font_FontFamily_static_0200 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Span_Font_FontFamily_static_0200 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('family')).assertEqual("HarmonyOS Sans");
          console.info('ArkUX_Stage_Span_Font_FontFamily_static_0200 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontFamily_static_0200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number   ArkUX_Stage_Span_Font_FontFamily_static_0300
     * @tc.name     ArkUX_Stage_Span_Font_FontFamily_static_0300
     * @tc.desc     ArkUX_Stage_Span_Font_FontFamily_static_0300
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Span_Font_FontFamily_static_0300', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Span_Font_FontFamily_static_0300 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Span_Font_FontFamily_static_0300');
          console.info('ArkUX_Stage_Span_Font_FontFamily_static_0300 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Span_Font_FontFamily_static_0300 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Span_Font_FontFamily_static_0300 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('family')).assertEqual("HarmonyOS Sans");
          console.info('ArkUX_Stage_Span_Font_FontFamily_static_0300 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontFamily_static_0300 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number   ArkUX_Stage_Span_Font_FontFamily_static_0400
     * @tc.name     ArkUX_Stage_Span_Font_FontFamily_static_0400
     * @tc.desc     ArkUX_Stage_Span_Font_FontFamily_static_0400
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Span_Font_FontFamily_static_0400', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Span_Font_FontFamily_static_0400 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Span_Font_FontFamily_static_0400');
          console.info('ArkUX_Stage_Span_Font_FontFamily_static_0400 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Span_Font_FontFamily_static_0400 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Span_Font_FontFamily_static_0400 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('family')).assertEqual("HarmonyOS Sans");
          console.info('ArkUX_Stage_Span_Font_FontFamily_static_0400 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontFamily_static_0400 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number   ArkUX_Stage_Span_Font_FontFamily_static_0500
     * @tc.name     ArkUX_Stage_Span_Font_FontFamily_static_0500
     * @tc.desc     ArkUX_Stage_Span_Font_FontFamily_static_0500
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Span_Font_FontFamily_static_0500', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Span_Font_FontFamily_static_0500 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Span_Font_FontFamily_static_0500');
          console.info('ArkUX_Stage_Span_Font_FontFamily_static_0500 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Span_Font_FontFamily_static_0500 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Span_Font_FontFamily_static_0500 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('family')).assertEqual("HarmonyOS Sans");
          console.info('ArkUX_Stage_Span_Font_FontFamily_static_0500 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontFamily_static_0500 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number   ArkUX_Stage_Span_Font_FontFamily_static_0600
     * @tc.name     ArkUX_Stage_Span_Font_FontFamily_static_0600
     * @tc.desc     ArkUX_Stage_Span_Font_FontFamily_static_0600
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Span_Font_FontFamily_static_0600', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Span_Font_FontFamily_static_0600 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Span_Font_FontFamily_static_0600');
          console.info('ArkUX_Stage_Span_Font_FontFamily_static_0600 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Span_Font_FontFamily_static_0600 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Span_Font_FontFamily_static_0600 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('family')).assertEqual("HarmonyOS Sans");
          console.info('ArkUX_Stage_Span_Font_FontFamily_static_0600 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontFamily_static_0600 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number   ArkUX_Stage_Span_Font_FontFamily_static_0700
     * @tc.name     ArkUX_Stage_Span_Font_FontFamily_static_0700
     * @tc.desc     ArkUX_Stage_Span_Font_FontFamily_static_0700
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Stage_Span_Font_FontFamily_static_0700', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Stage_Span_Font_FontFamily_static_0700 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Span_Font_FontFamily_static_0700');
          console.info('ArkUX_Stage_Span_Font_FontFamily_static_0700 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Stage_Span_Font_FontFamily_static_0700 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));

          console.info("ArkUX_Stage_Span_Font_FontFamily_static_0700 JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')) is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('font')).getString('family')).assertEqual("Arial, sans-serif");
          console.info('ArkUX_Stage_Span_Font_FontFamily_static_0700 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontFamily_0900 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

  })
}