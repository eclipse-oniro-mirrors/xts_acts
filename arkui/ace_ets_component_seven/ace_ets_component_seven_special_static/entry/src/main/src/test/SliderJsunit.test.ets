'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../hypium/index'
import router from '@ohos.router'
import Utils from '../../ets/MainAbility/common/Utils';
import inspector from '@ohos.arkui.inspector'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from './Util.test'

export default function sliderTest() {
    describe('sliderJsunit', () => {
      beforeAll(() => {
        console.info("sliderJsunit beforeEach start");
        await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")
      });
      beforeEach(async (): Promise<void> => {
        console.info("sliderJsunit beforeEach start");
        let options: router.RouterOptions = {
          url: 'MainAbility/pages/slider',
        }
        try {
          const routerInstance = AppStorage.get<Router>("router") as Router
          routerInstance.clear();
          let pages = routerInstance.getState();
          console.info("get slider state pages: " + JSON.stringify(pages));
          if (!("slider" == pages.name)) {
            console.info("get slider state pages.name: " + JSON.stringify(pages.name));
            routerInstance.pushUrl(options);
            await Utils.sleep(2000);
          }
        } catch (err) {
          console.error("push slider page error: " + err);
        }
      })

   
    
    
/**
     * @tc.number   ArkUX_Stage_Slider_blockBorderColor_static_0100
     * @tc.name     ArkUX_Stage_Slider_blockBorderColor_static_0100
     * @tc.desc     ArkUX_Stage_Slider_blockBorderColor_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Slider_blockBorderColor_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockBorderColor_static_0100] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockBorderColor_0100');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_blockBorderColor_0100 is" + JSON.stringify(obj.getElement('$attrs').getString('blockBorderColor')));
          expect(obj.getElement('$attrs').getString('blockBorderColor')).assertEqual("#FFFFA500");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockBorderColor_static_0100 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    
    
    
/**
     * @tc.number   ArkUX_Stage_Slider_blockBorderWidth_static_0100
     * @tc.name     ArkUX_Stage_Slider_blockBorderWidth_static_0100
     * @tc.desc     ArkUX_Stage_Slider_blockBorderWidth_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Slider_blockBorderWidth_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockBorderWidth_static_0100] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockBorderWidth_0100');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_blockBorderWidth_static_0100 is" + JSON.stringify(obj.getElement('$attrs').getString('blockBorderWidth')));
          expect(obj.getElement('$attrs').getString('blockBorderWidth')).assertEqual("5.00vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockBorderWidth_static_1100 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

   
    
    
/**
     * @tc.number   ArkUX_Stage_Slider_stepColor_static_0100
     * @tc.name     ArkUX_Stage_Slider_stepColor_static_0100
     * @tc.desc     ArkUX_Stage_Slider_stepColor_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Slider_stepColor_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_stepColor_static_0100] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_stepColor_0100');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_stepColor_static_0100 is" + JSON.stringify(obj.getElement('$attrs').getString('stepColor')));
          expect(obj.getElement('$attrs').getString('stepColor')).assertEqual("#FFFFA500");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_stepColor_static_0100 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

   
    
    
/**
     * @tc.number   ArkUX_Stage_Slider_trackBorderRadius_static_0100
     * @tc.name     ArkUX_Stage_Slider_trackBorderRadius_static_0100
     * @tc.desc     ArkUX_Stage_Slider_trackBorderRadius_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Slider_trackBorderRadius_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_trackBorderRadius_static_0100] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_trackBorderRadius_0100');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_trackBorderRadius_static_0100 is" + JSON.stringify(obj.getElement('$attrs').getString('trackBorderRadius')));
          expect(obj.getElement('$attrs').getString('trackBorderRadius')).assertEqual("0.00vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_trackBorderRadius_static_0100 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

   
    
    
/**
     * @tc.number   ArkUX_Stage_Slider_blockSize_static_0100
     * @tc.name     ArkUX_Stage_Slider_blockSize_static_0100
     * @tc.desc     ArkUX_Stage_Slider_blockSize_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Slider_blockSize_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockSize_static_0100] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockSize_0100');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_blockSize_static_0100  is " + JSON.stringify(obj.getElement('$attrs').getElement('blockSize')));
          let width: string = obj.getElement('$attrs').getElement('blockSize').getString('width') ;
          let height: string = obj.getElement('$attrs').getElement('blockSize').getString('height') ;
          expect(parseFloat(width)).assertEqual(12);
          expect(parseFloat(height)).assertEqual(12);
          expect(width.substr(width.length-2, 2)).assertEqual("vp");
          expect(height.substr(height.length-2, 2)).assertEqual("vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockSize_static_0100 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

   
    
    
/**
     * @tc.number   ArkUX_Stage_Slider_stepSize_static_0100
     * @tc.name     ArkUX_Stage_Slider_stepSize_static_0100
     * @tc.desc     ArkUX_Stage_Slider_stepSize_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Slider_stepSize_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_stepSize_static_0100] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_stepSize_0100');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_stepSize_static_0100 is" + JSON.stringify(obj.getElement('$attrs').getString('stepSize')));
          expect(obj.getElement('$attrs').getString('stepSize')).assertEqual("0.00vp");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_stepSize_static_0100 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    
    
    
/**
     * @tc.number   ArkUX_Stage_Slider_blockStyle_static_0100
     * @tc.name     ArkUX_Stage_Slider_blockStyle_static_0100
     * @tc.desc     ArkUX_Stage_Slider_blockStyle_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Slider_blockStyle_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockStyle_static_0100] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockStyle_0100');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_blockStyle_static_0100 is" + JSON.stringify(obj.getElement('$attrs').getString('blockType')));
          expect(obj.getElement('$attrs').getString('blockType')).assertEqual("BlockStyleType.DEFAULT");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockStyle_static_0100  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

   
    
    
/**
     * @tc.number   ArkUX_Stage_Slider_blockColor_static_0100
     * @tc.name     ArkUX_Stage_Slider_blockColor_static_0100
     * @tc.desc     ArkUX_Stage_Slider_blockColor_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Slider_blockColor_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_blockColor_static_0100] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_blockColor_0100');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_blockColor_static_0100 is" + JSON.stringify(obj.getElement('$attrs').getString('blockColor')));
          expect(obj.getElement('$attrs').getString('blockColor')).assertEqual("#FF0000FF");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockColor_static_0100  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

   
    
    
/**
     * @tc.number   ArkUX_Stage_Slider_trackColor_static_0100
     * @tc.name     ArkUX_Stage_Slider_trackColor_static_0100
     * @tc.desc     ArkUX_Stage_Slider_trackColor_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Slider_trackColor_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_trackColor_static_0100] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_trackColor_0100');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_trackColor_static_0100 is" + JSON.stringify(obj.getElement('$attrs').getString('trackColor')));
          expect(obj.getElement('$attrs').getString('trackColor')).assertEqual("#FF808080");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_trackColor_static_0100  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    
    
    
/**
     * @tc.number   ArkUX_Stage_Slider_selectedColor_static_0100
     * @tc.name     ArkUX_Stage_Slider_selectedColor_static_0100
     * @tc.desc     ArkUX_Stage_Slider_selectedColor_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Slider_selectedColor_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_selectedColor_static_0100] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_selectedColor_0100');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_selectedColor_static_0100 is" + JSON.stringify(obj.getElement('$attrs').getString('selectedColor')));
          expect(obj.getElement('$attrs').getString('selectedColor')).assertEqual("#FF0000FF");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_selectedColor_static_0100  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

   
    
    
/**
     * @tc.number   ArkUX_Stage_Slider_showSteps_static_0100
     * @tc.name     ArkUX_Stage_Slider_showSteps_static_0100
     * @tc.desc     ArkUX_Stage_Slider_showSteps_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Slider_showSteps_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_showSteps_static_0100] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_showSteps_0100');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_showSteps_static_0100 is" + JSON.stringify(obj.getElement('$attrs').getString('showSteps')));
          expect(obj.getElement('$attrs').getString('showSteps')).assertEqual("true");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_showSteps_static_0100  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    
    
    
/**
     * @tc.number   ArkUX_Stage_Slider_showTips_static_0100
     * @tc.name     ArkUX_Stage_Slider_showTips_static_0100
     * @tc.desc     ArkUX_Stage_Slider_showTips_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Slider_showTips_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_showTips_static_0100] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_showTips_0100');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_showTips_static_0100 is" + JSON.stringify(obj.getElement('$attrs').getString('showTips')));
          expect(obj.getElement('$attrs').getString('showTips')).assertEqual("true");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_showTips_static_0100  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

   
    
    
/**
     * @tc.number   ArkUX_Stage_Slider_trackThickness_static_0100
     * @tc.name     ArkUX_Stage_Slider_trackThickness_static_0100
     * @tc.desc     ArkUX_Stage_Slider_trackThickness_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Slider_trackThickness_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ArkUX_Stage_Slider_trackThickness_static_0100] START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Slider_trackThickness_0100');
          let obj = JSON.parseJsonElement(strJson);
          console.info("----ArkUX_Stage_Slider_trackThickness_static_0100 is" + JSON.stringify(obj.getElement('$attrs').getString('trackThickness')));
          expect(obj.getElement('$attrs').getString('trackThickness')).assertEqual("1.00vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_trackThickness_static_0100  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })
  })
}
