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
import { afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;
let emitKey = "emitUserAgent";

export default function clickeffectTest() {
  describe('ActsClickEffectTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("clickeffectTest beforeAll start");
      
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsVisual.api11.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("ActsClickEffectTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/clickeffect/Index',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ActsClickEffectTest state pages:" + JSON.stringify(pages));
        if (!("clickeffect" == pages.name)) {
          console.info("get ActsClickEffectTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ActsClickEffectTest page error:" + err);
      }
      console.info("ActsClickEffectTest beforeEach end");
    });


    
    
/**
     * @tc.number   ArkUXII_Stage_ClickEffect_Toggle_static_0100
     * @tc.name     ArkUXII_Stage_ClickEffect_Toggle_static_0100
     * @tc.desc     ArkUXII_Stage_ClickEffect_Toggle_static_0100
     * @tc.level    Level.LEVEL2
     */
it('ArkUXII_Stage_ClickEffect_Toggle_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("ArkUXII_Stage_ClickEffect_Toggle_0100 start");
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('clickEffect_1');
          console.info("[ArkUXII_Stage_ClickEffect_Toggle_0100]:" +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('clickEffect')));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('clickEffect').getString('level'))
            .assertEqual('0');
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('clickEffect').getString('scale'))
            .assertEqual('0.900000');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUXII_Stage_ClickEffect_Toggle_0100 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    
/**
     * @tc.number   ArkUXII_Stage_ClickEffect_Toggle_static_0200
     * @tc.name     ArkUXII_Stage_ClickEffect_Toggle_static_0200
     * @tc.desc     ArkUXII_Stage_ClickEffect_Toggle_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ArkUXII_Stage_ClickEffect_Toggle_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUXII_Stage_ClickEffect_Toggle_0200 start");
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('clickEffect_2');
          console.info("[ArkUXII_Stage_ClickEffect_Toggle_0200]:" +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('clickEffect')));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('clickEffect').getString('level'))
            .assertEqual('1');
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('clickEffect').getString('scale'))
            .assertEqual('0.950000');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUXII_Stage_ClickEffect_Toggle_0200 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    
/**
     * @tc.number   ArkUXII_Stage_ClickEffect_Toggle_static_0300
     * @tc.name     ArkUXII_Stage_ClickEffect_Toggle_static_0300
     * @tc.desc     ArkUXII_Stage_ClickEffect_Toggle_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ArkUXII_Stage_ClickEffect_Toggle_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUXII_Stage_ClickEffect_Toggle_0300 start");
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('clickEffect_3');
          console.info("[ArkUXII_Stage_ClickEffect_Toggle_0300]:" +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('clickEffect')));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('clickEffect').getString('level'))
            .assertEqual('2');
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('clickEffect').getString('scale'))
            .assertEqual('0.950000');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUXII_Stage_ClickEffect_Toggle_0300 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    
/**
     * @tc.number   ArkUXII_Stage_ClickEffect_Toggle_static_0400
     * @tc.name     ArkUXII_Stage_ClickEffect_Toggle_static_0400
     * @tc.desc     ArkUXII_Stage_ClickEffect_Toggle_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ArkUXII_Stage_ClickEffect_Toggle_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUXII_Stage_ClickEffect_Toggle_0400 start");
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('clickEffect_4');
          console.info("[ArkUXII_Stage_ClickEffect_Toggle_0400]:" +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('clickEffect')));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('clickEffect').getString('level'))
            .assertEqual('0');
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('clickEffect').getString('scale'))
            .assertEqual('0.000000');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUXII_Stage_ClickEffect_Toggle_0400 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    
/**
     * @tc.number   ArkUXII_Stage_ClickEffect_Toggle_static_0500
     * @tc.name     ArkUXII_Stage_ClickEffect_Toggle_static_0500
     * @tc.desc     ArkUXII_Stage_ClickEffect_Toggle_static_0500
     * @tc.level    Level.LEVEL0
     */
it('ArkUXII_Stage_ClickEffect_Toggle_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUXII_Stage_ClickEffect_Toggle_0500 start");
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('clickEffect_5');
          console.info("[ArkUXII_Stage_ClickEffect_Toggle_0500]:" +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('clickEffect')));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('clickEffect').getString('level'))
            .assertEqual('0');
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('clickEffect').getString('scale'))
            .assertEqual('1.000000');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUXII_Stage_ClickEffect_Toggle_0500 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    
/**
     * @tc.number   ArkUXII_Stage_ClickEffect_Toggle_static_0600
     * @tc.name     ArkUXII_Stage_ClickEffect_Toggle_static_0600
     * @tc.desc     ArkUXII_Stage_ClickEffect_Toggle_static_0600
     * @tc.level    Level.LEVEL0
     */
it('ArkUXII_Stage_ClickEffect_Toggle_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUXII_Stage_ClickEffect_Options_0600 start");
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('clickEffect_6');
          console.info("[ArkUXII_Stage_ClickEffect_Toggle_0600]:" +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('clickEffect')));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('clickEffect').getString('level'))
            .assertEqual('0');
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('clickEffect').getString('scale'))
            .assertEqual('0.500000');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUXII_Stage_ClickEffect_Toggle_0600 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    
/**
     * @tc.number   ArkUXII_Stage_ClickEffect_Toggle_static_0700
     * @tc.name     ArkUXII_Stage_ClickEffect_Toggle_static_0700
     * @tc.desc     ArkUXII_Stage_ClickEffect_Toggle_static_0700
     * @tc.level    Level.LEVEL0
     */
it('ArkUXII_Stage_ClickEffect_Toggle_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUXII_Stage_ClickEffect_Toggle_0700 start");
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('clickEffect_7');
          console.info("[ArkUXII_Stage_ClickEffect_Toggle_0700]:" +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('clickEffect')));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('clickEffect').getString('level'))
            .assertEqual('0');
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('clickEffect').getString('scale'))
            .assertEqual('0.800000');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUXII_Stage_ClickEffect_Toggle_0700 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    
/**
     * @tc.number   ArkUXII_Stage_ClickEffect_Toggle_static_0800
     * @tc.name     ArkUXII_Stage_ClickEffect_Toggle_static_0800
     * @tc.desc     ArkUXII_Stage_ClickEffect_Toggle_static_0800
     * @tc.level    Level.LEVEL0
     */
it('ArkUXII_Stage_ClickEffect_Toggle_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUXII_Stage_ClickEffect_Toggle_0800 start");
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('clickEffect_8');
          console.info("[ArkUXII_Stage_ClickEffect_Toggle_0800]:" +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('clickEffect')));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('clickEffect').getString('level'))
            .assertEqual('0');
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('clickEffect').getString('scale'))
            .assertEqual('0.900000');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUXII_Stage_ClickEffect_Toggle_0800 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    
/**
     * @tc.number   ArkUXII_Stage_ClickEffect_Toggle_static_0900
     * @tc.name     ArkUXII_Stage_ClickEffect_Toggle_static_0900
     * @tc.desc     ArkUXII_Stage_ClickEffect_Toggle_static_0900
     * @tc.level    Level.LEVEL0
     */
it('ArkUXII_Stage_ClickEffect_Toggle_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUXII_Stage_ClickEffect_Toggle_0900 start");
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('clickEffect_9');
          console.info("[ArkUXII_Stage_ClickEffect_Toggle_0900]:" +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('clickEffect')));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('clickEffect').getString('level'))
            .assertEqual('0');
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('clickEffect').getString('scale'))
            .assertEqual('0.100000');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUXII_Stage_ClickEffect_Toggle_0900 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    
/**
     * @tc.number   ArkUXII_Stage_ClickEffect_Toggle_static_1000
     * @tc.name     ArkUXII_Stage_ClickEffect_Toggle_static_1000
     * @tc.desc     ArkUXII_Stage_ClickEffect_Toggle_static_1000
     * @tc.level    Level.LEVEL0
     */
it('ArkUXII_Stage_ClickEffect_Toggle_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUXII_Stage_ClickEffect_Toggle_1000 start");
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('clickEffect_10');
          console.info("[ArkUXII_Stage_ClickEffect_Toggle_1000]:" +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('clickEffect')));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('clickEffect').getString('level'))
            .assertEqual('0');
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('clickEffect').getString('scale'))
            .assertEqual('0.000000');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUXII_Stage_ClickEffect_Toggle_1000 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    
/**
     * @tc.number   ArkUXII_Stage_ClickEffect_Toggle_static_1100
     * @tc.name     ArkUXII_Stage_ClickEffect_Toggle_static_1100
     * @tc.desc     ArkUXII_Stage_ClickEffect_Toggle_static_1100
     * @tc.level    Level.LEVEL0
     */
it('ArkUXII_Stage_ClickEffect_Toggle_static_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUXII_Stage_ClickEffect_Options_01000 start");
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('clickEffect_11');
          console.info("[ArkUXII_Stage_ClickEffect_Toggle_1100]:" +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('clickEffect')));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('clickEffect').getString('level'))
            .assertEqual('2');
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('clickEffect').getString('scale'))
            .assertEqual('0.100000');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUXII_Stage_ClickEffect_Toggle_1100 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    
/**
     * @tc.number   ArkUXII_Stage_ClickEffect_Toggle_static_1200
     * @tc.name     ArkUXII_Stage_ClickEffect_Toggle_static_1200
     * @tc.desc     ArkUXII_Stage_ClickEffect_Toggle_static_1200
     * @tc.level    Level.LEVEL0
     */
it('ArkUXII_Stage_ClickEffect_Toggle_static_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUXII_Stage_ClickEffect_Toggle_1200 start");
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('clickEffect_12');
          console.info("[ArkUXII_Stage_ClickEffect_Toggle_1200]:" +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('clickEffect')));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('clickEffect').getString('level'))
            .assertEqual('0');
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('clickEffect').getString('scale'))
            .assertEqual('0.900000');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUXII_Stage_ClickEffect_Toggle_1200 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    
    
/**
     * @tc.number   ArkUXII_Stage_ClickEffect_Toggle_static_1300
     * @tc.name     ArkUXII_Stage_ClickEffect_Toggle_static_1300
     * @tc.desc     ArkUXII_Stage_ClickEffect_Toggle_static_1300
     * @tc.level    Level.LEVEL2
     */
it('ArkUXII_Stage_ClickEffect_Toggle_static_1300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("ArkUXII_Stage_ClickEffect_Toggle_1300 start");
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('clickEffect_13');
          console.info("[ArkUXII_Stage_ClickEffect_Toggle_1300]:" +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('clickEffect')));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('clickEffect').getString('level'))
            .assertEqual('1');
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('clickEffect').getString('scale'))
            .assertEqual('0.950000');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUXII_Stage_ClickEffect_Toggle_1300 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    
/**
     * @tc.number   ArkUXII_Stage_ClickEffect_Toggle_static_1400
     * @tc.name     ArkUXII_Stage_ClickEffect_Toggle_static_1400
     * @tc.desc     ArkUXII_Stage_ClickEffect_Toggle_static_1400
     * @tc.level    Level.LEVEL0
     */
it('ArkUXII_Stage_ClickEffect_Toggle_static_1400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUXII_Stage_ClickEffect_Toggle_1400 start");
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('clickEffect_14');
          console.info("[ArkUXII_Stage_ClickEffect_Toggle_1400]:" +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('clickEffect')));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('clickEffect').getString('level'))
            .assertEqual('2');
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('clickEffect').getString('scale'))
            .assertEqual('0.950000');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUXII_Stage_ClickEffect_Toggle_1400 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    
/**
     * @tc.number   ArkUXII_Stage_ClickEffect_Toggle_static_1500
     * @tc.name     ArkUXII_Stage_ClickEffect_Toggle_static_1500
     * @tc.desc     ArkUXII_Stage_ClickEffect_Toggle_static_1500
     * @tc.level    Level.LEVEL0
     */
it('ArkUXII_Stage_ClickEffect_Toggle_static_1500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUXII_Stage_ClickEffect_Toggle_1500 start");
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('clickEffect_15');
          console.info("[ArkUXII_Stage_ClickEffect_Toggle_1500]:" +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('clickEffect')));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('clickEffect').getString('level'))
            .assertEqual('1');
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('clickEffect').getString('scale'))
            .assertEqual('0.950000');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUXII_Stage_ClickEffect_Toggle_1500 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    
/**
     * @tc.number   ArkUXII_Stage_ClickEffect_Toggle_static_1600
     * @tc.name     ArkUXII_Stage_ClickEffect_Toggle_static_1600
     * @tc.desc     ArkUXII_Stage_ClickEffect_Toggle_static_1600
     * @tc.level    Level.LEVEL0
     */
it('ArkUXII_Stage_ClickEffect_Toggle_static_1600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUXII_Stage_ClickEffect_Toggle_1600 start");
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('clickEffect_16');
          console.info("[ArkUXII_Stage_ClickEffect_Toggle_1600]:" +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('clickEffect')));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('clickEffect').getString('level'))
            .assertEqual('0');
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('clickEffect').getString('scale'))
            .assertEqual('0.900000');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUXII_Stage_ClickEffect_Toggle_1600 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });
  })
}
