'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level
} from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { UIContext, Router } from "@ohos.arkui.UIContext";
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import { $r, Resource, ArrowStyle } from '@ohos.arkui.component';
import events_emitter from '@ohos.events.emitter';
import { UtilsTest, startAbility } from '../Util.test';
import { RecordData } from '@ohos.base';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;
const waitUiReadyMs = 1000;
const uiContext = new UIContext();

function sleep(time: int) {
  return new Promise<string>((resolve, reject) => {
    setTimeout(() => {
      resolve("ok")
    }, time)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}

// function swiperDefaultFontSize(sysWidth: Resource) {
//   const context = AppStorage.get<common.AbilityStageContext>('stageContext') as common.AbilityStageContext;
//   let resourceFontSize = context.resourceManager.getNumber(sysWidth.id)
//   let newFontSize: string = Math.round(uiContext.px2vp(resourceFontSize)) + '.00fp'
//   return newFontSize;
// }

async function setArrowStyle(arrowStyle: ArrowStyle) {
  try {
    let backData: events_emitter.EventData = {
      data: {
        "arrowStyle": JSON.stringify(arrowStyle)
      } as Record<String,RecordData>
    } as events_emitter.EventData
    let backEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    console.info("setArrowStyle start send emitKey");
    console.info("setArrowStyle backData :" + JSON.stringify(backData));
    events_emitter.emit(backEvent, backData);
  } catch (err: Error) {
    console.info("setArrowStyle emit emitKey  err: " + JSON.stringify(err));
  }
  await sleep(2000);
}

export default function swiperTest_1() {
  describe('ActSwiperTest_1', () => {
    beforeAll(() => {
      console.info("swiperTest_1 beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.swiper.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Swiper/Swiper1_1",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router;
        router.clear();
        let pages = router.getState();
        if (pages == null || !("Swiper1_1" == pages.name)) {
          router.pushUrl(options)
          //   .then(() => {
          //   console.info(`Swiper1_1 router.pushUrl success`);
          // }).catch((error: Error): void => {
          //   console.error(`Swiper1_1 router.pushUrl failed, code is ${error.code}, message is ${error.message}`);
          // })
          await CommonFunc.sleep(2000);
        }
      } catch (err: Error) {
        console.error(`Swiper1_1 beforeEach error:` + JSON.stringify(err));
      }
    });
    afterEach(async (): Promise<void> => {
      await setArrowStyle(
        {} as ArrowStyle
      )
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_SelectedDigitFont_static_0100
     * @tc.name     ArkUX_Stage_Swiper_SelectedDigitFont_static_0100
     * @tc.desc     ArkUX_Stage_Swiper_SelectedDigitFont_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_SelectedDigitFont_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_SelectedDigitFont_static_0100 START');
      // setTimeout(() => {
      //   try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_SelectedDigitFont_0100');
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_static_0100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_static_0100 component obj is: " +
          JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_static_0100 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_SelectedDigitFont_static_0100 component obj.$attrs.selectedDigitFont is: " +
          // JSON.stringify(obj.getElement('$attrs').getString('selectedDigitFont')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_static_0100 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('selectedFontSize')).assertEqual("34.00fp");
          expect(obj2.getString('selectedFontWeight')).assertEqual("800");
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_static_0100 END ');
          done();
      //   } catch (err: Error) {
      //     expect().assertFail();
      //     console.info('ArkUX_Stage_Swiper_SelectedDigitFont_static_0100 ERR  ' + JSON.stringify(err));
      //     done();
      //   }
      // }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_SelectedDigitFont_static_0200
     * @tc.name     ArkUX_Stage_Swiper_SelectedDigitFont_static_0200
     * @tc.desc     ArkUX_Stage_Swiper_SelectedDigitFont_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_SelectedDigitFont_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_SelectedDigitFont_static_0200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_SelectedDigitFont_0200');
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_static_0200 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_static_0200 component obj is: " +
          JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_static_0200 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_SelectedDigitFont_static_0200 component obj.$attrs.selectedDigitFont is: " +
          // JSON.stringify(obj.getElement('$attrs').getString('selectedDigitFont')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_static_0200 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('selectedFontSize')).assertEqual("20.00px");
          expect(obj2.getString('selectedFontWeight')).assertEqual("200");
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_static_0200 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_static_0200 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_SelectedDigitFont_static_0300
     * @tc.name     ArkUX_Stage_Swiper_SelectedDigitFont_static_0300
     * @tc.desc     ArkUX_Stage_Swiper_SelectedDigitFont_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_SelectedDigitFont_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_SelectedDigitFont_static_0300 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_SelectedDigitFont_0300');
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_static_0300 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_static_0300 component obj is: " +
          JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_static_0300 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_SelectedDigitFont_static_0300 component obj.$attrs.selectedDigitFont is: " +
          // JSON.stringify(obj.getElement('$attrs').getElement('selectedDigitFont')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_static_0300 component obj2 is: " +
          JSON.stringify(obj2));
          // expect(obj2.getElement('selectedFontSize'))
          //   .assertEqual(swiperDefaultFontSize($r('sys.float.ohos_id_text_size_body2')));
          expect(obj2.getString('selectedFontWeight')).assertEqual("900");
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_static_0300 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_static_0300 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_SelectedDigitFont_static_0400
     * @tc.name     ArkUX_Stage_Swiper_SelectedDigitFont_static_0400
     * @tc.desc     ArkUX_Stage_Swiper_SelectedDigitFont_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_SelectedDigitFont_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_SelectedDigitFont_static_0400 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_SelectedDigitFont_0400');
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_static_0400 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_static_0400 component obj is: " +
          JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_static_0400 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_SelectedDigitFont_static_0400 component obj.$attrs.selectedDigitFont is: " +
          // JSON.stringify(obj.getElement('$attrs').getElement('selectedDigitFont')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_static_0400 component obj2 is: " +
          JSON.stringify(obj2));
          // expect(obj2.getString('selectedFontSize'))
          //   .assertEqual(swiperDefaultFontSize($r('sys.float.ohos_id_text_size_body2')));
          expect(obj2.getString('selectedFontWeight')).assertEqual("FontWeight.Bolder");
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_static_0400 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_static_0400 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_SelectedDigitFont_static_0500
     * @tc.name     ArkUX_Stage_Swiper_SelectedDigitFont_static_0500
     * @tc.desc     ArkUX_Stage_Swiper_SelectedDigitFont_static_0500
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_SelectedDigitFont_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_SelectedDigitFont_static_0500 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_SelectedDigitFont_0500');
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_static_0500 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_static_0500 component obj is: " +
          JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_static_0500 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_SelectedDigitFont_static_0500 component obj.$attrs.selectedDigitFont is: " +
          // JSON.stringify(obj.getElement('$attrs').getElement('selectedDigitFont')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_static_0500 component obj2 is: " +
          JSON.stringify(obj2));
          // expect(obj2.getElement('selectedFontSize'))
          //   .assertEqual(swiperDefaultFontSize($r('sys.float.ohos_id_text_size_body2')));
          expect(obj2.getString('selectedFontWeight')).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_static_0500 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_static_0500 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_SelectedDigitFont_static_0600
     * @tc.name     ArkUX_Stage_Swiper_SelectedDigitFont_static_0600
     * @tc.desc     ArkUX_Stage_Swiper_SelectedDigitFont_static_0600
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_SelectedDigitFont_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_SelectedDigitFont_static_0600 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_SelectedDigitFont_0600');
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_static_0600 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_static_0600 component obj is: " +
          JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_static_0600 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_SelectedDigitFont_static_0600 component obj.$attrs.selectedDigitFont is: " +
          // JSON.stringify(obj.getElement('$attrs').getElement('selectedDigitFont')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_static_0600 component obj2 is: " +
          JSON.stringify(obj2));
          // expect(obj2.getElement('selectedFontSize'))
          //   .assertEqual(swiperDefaultFontSize($r('sys.float.ohos_id_text_size_body2')));
          expect(obj2.getString('selectedFontWeight')).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_static_0600 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_static_0600 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_SelectedDigitFont_static_0700
     * @tc.name     ArkUX_Stage_Swiper_SelectedDigitFont_static_0700
     * @tc.desc     ArkUX_Stage_Swiper_SelectedDigitFont_static_0700
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_SelectedDigitFont_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_SelectedDigitFont_static_0700 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_SelectedDigitFont_0700');
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_static_0700 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_static_0700 component obj is: " +
          JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_static_0700 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_SelectedDigitFont_static_0700 component obj.$attrs.selectedDigitFont is: " +
          // JSON.stringify(obj.getElement('$attrs').getElement('selectedDigitFont')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_static_0700 component obj2 is: " +
          JSON.stringify(obj2));
          // expect(obj2.getElement('selectedFontSize'))
          //   .assertEqual(swiperDefaultFontSize($r('sys.float.ohos_id_text_size_body2')));
          expect(obj2.getString('selectedFontWeight')).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_static_0700 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_static_0700 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_SelectedDigitFont_static_0800
     * @tc.name     ArkUX_Stage_Swiper_SelectedDigitFont_static_0800
     * @tc.desc     ArkUX_Stage_Swiper_SelectedDigitFont_static_0800
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_SelectedDigitFont_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_SelectedDigitFont_static_0800 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_SelectedDigitFont_0800');
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_static_0800 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_static_0800 component obj is: " +
          JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_static_0800 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_SelectedDigitFont_static_0800 component obj.$attrs.selectedDigitFont is: " +
          // JSON.stringify(obj.getElement('$attrs').getElement('selectedDigitFont')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_static_0800 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('selectedFontSize')).assertEqual("100.00vp");
          expect(obj2.getString('selectedFontWeight')).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_static_0800 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_static_0800 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_SelectedDigitFont_static_0900
     * @tc.name     ArkUX_Stage_Swiper_SelectedDigitFont_static_0900
     * @tc.desc     ArkUX_Stage_Swiper_SelectedDigitFont_static_0900
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_SelectedDigitFont_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_SelectedDigitFont_static_0900 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_SelectedDigitFont_0900');
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_static_0900 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_static_0900 component obj is: " +
          JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_static_0900 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_SelectedDigitFont_static_0900 component obj.$attrs.selectedDigitFont is: " +
          // JSON.stringify(obj.getElement('$attrs').getElement('selectedDigitFont')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_static_0900 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('selectedFontSize')).assertEqual("40.00lpx");
          expect(obj2.getString('selectedFontWeight')).assertEqual("500");
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_static_0900 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_static_0900 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_SelectedDigitFont_static_1000
     * @tc.name     ArkUX_Stage_Swiper_SelectedDigitFont_static_1000
     * @tc.desc     ArkUX_Stage_Swiper_SelectedDigitFont_static_1000
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_SelectedDigitFont_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_SelectedDigitFont_static_1000 START');
      // setTimeout(() => {
      //   try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_SelectedDigitFont_1000');
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_static_1000 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_static_1000 component obj is: " +
          JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_static_1000 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_SelectedDigitFont_static_1000 component obj.$attrs.selectedDigitFont is: " +
          // JSON.stringify(obj.getElement('$attrs').getElement('selectedDigitFont')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_static_1000 component obj2 is: " +
          JSON.stringify(obj2));
          // expect(obj2.getElement('selectedFontSize'))
          //   .assertEqual(swiperDefaultFontSize($r('sys.float.ohos_id_text_size_body2')));
          expect(obj2.getString('selectedFontWeight')).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_static_1000 END ');
          done();
      //   } catch (err: Error) {
      //     expect().assertFail();
      //     console.info('ArkUX_Stage_Swiper_SelectedDigitFont_static_1000 ERR  ' + JSON.stringify(err));
      //     done();
      //   }
      // }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_SelectedDigitFont_static_1100
     * @tc.name     ArkUX_Stage_Swiper_SelectedDigitFont_static_1100
     * @tc.desc     ArkUX_Stage_Swiper_SelectedDigitFont_static_1100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_SelectedDigitFont_static_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_SelectedDigitFont_static_1100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_SelectedDigitFont_1100');
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_static_1100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_static_1100 component obj is: " +
          JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_static_1100 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_SelectedDigitFont_static_1100 component obj.$attrs.selectedDigitFont is: " +
          // JSON.stringify(obj.getElement('$attrs').getElement('selectedDigitFont')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_static_1100 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('selectedFontSize')).assertEqual("10.00fp");
          expect(obj2.getString('selectedFontWeight')).assertEqual("600");
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_static_1100 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_static_1100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_DigitFont_static_0100
     * @tc.name     ArkUX_Stage_Swiper_DigitFont_static_0100
     * @tc.desc     ArkUX_Stage_Swiper_DigitFont_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_DigitFont_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_DigitFont_static_0100 START');
      // setTimeout(() => {
      //   try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_DigitFont_0100');
          console.info('ArkUX_Stage_Swiper_DigitFont_static_0100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_DigitFont_static_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_DigitFont_static_0100 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_DigitFont_static_0100 component obj.$attrs.digitFont is: " +
          // JSON.stringify(obj.getElement('$attrs').getElement('digitFont')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_DigitFont_static_0100 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('fontSize')).assertEqual("34.00fp");
          expect(obj2.getString('fontWeight')).assertEqual("800");
          console.info('ArkUX_Stage_Swiper_DigitFont_static_0100 END ');
          done();
      //   } catch (err: Error) {
      //     expect().assertFail();
      //     console.info('ArkUX_Stage_Swiper_DigitFont_static_0100 ERR  ' + JSON.stringify(err));
      //     done();
      //   }
      // }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_DigitFont_static_0200
     * @tc.name     ArkUX_Stage_Swiper_DigitFont_static_0200
     * @tc.desc     ArkUX_Stage_Swiper_DigitFont_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_DigitFont_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_DigitFont_static_0200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_DigitFont_0200');
          console.info('ArkUX_Stage_Swiper_DigitFont_static_0200 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_DigitFont_static_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_DigitFont_static_0200 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_DigitFont_static_0200 component obj.$attrs.digitFont is: " +
          // JSON.stringify(obj.getElement('$attrs').getElement('digitFont')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_DigitFont_static_0200 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('fontSize')).assertEqual("20.00px");
          expect(obj2.getString('fontWeight')).assertEqual("200");
          console.info('ArkUX_Stage_Swiper_DigitFont_static_0200 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_DigitFont_static_0200 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_DigitFont_static_0300
     * @tc.name     ArkUX_Stage_Swiper_DigitFont_static_0300
     * @tc.desc     ArkUX_Stage_Swiper_DigitFont_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_DigitFont_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_DigitFont_static_0300 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_DigitFont_0300');
          console.info('ArkUX_Stage_Swiper_DigitFont_static_0300 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_DigitFont_static_0300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_DigitFont_static_0300 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_DigitFont_static_0300 component obj.$attrs.digitFont is: " +
          // JSON.stringify(obj.getElement('$attrs').getElement('digitFont')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_DigitFont_static_0300 component obj2 is: " +
          JSON.stringify(obj2));
          // expect(obj2.getElement('fontSize'))
          //   .assertEqual(swiperDefaultFontSize($r('sys.float.ohos_id_text_size_body2')));
          expect(obj2.getString('fontWeight')).assertEqual("900");
          console.info('ArkUX_Stage_Swiper_DigitFont_static_0300 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_DigitFont_static_0300 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_DigitFont_static_0400
     * @tc.name     ArkUX_Stage_Swiper_DigitFont_static_0400
     * @tc.desc     ArkUX_Stage_Swiper_DigitFont_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_DigitFont_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_DigitFont_static_0400 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_DigitFont_0400');
          console.info('ArkUX_Stage_Swiper_DigitFont_static_0400 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_DigitFont_static_0400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_DigitFont_static_0400 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_DigitFont_static_0400 component obj.$attrs.digitFont is: " +
          // JSON.stringify(obj.getElement('$attrs').getElement('digitFont')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_DigitFont_static_0400 component obj2 is: " +
          JSON.stringify(obj2));
          // expect(obj2.getElement('fontSize'))
          //   .assertEqual(swiperDefaultFontSize($r('sys.float.ohos_id_text_size_body2')));
          expect(obj2.getString('fontWeight')).assertEqual("FontWeight.Bolder");
          console.info('ArkUX_Stage_Swiper_DigitFont_static_0400 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_DigitFont_static_0400 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_DigitFont_static_0500
     * @tc.name     ArkUX_Stage_Swiper_DigitFont_static_0500
     * @tc.desc     ArkUX_Stage_Swiper_DigitFont_static_0500
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_DigitFont_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_DigitFont_static_0500 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_DigitFont_0500');
          console.info('ArkUX_Stage_Swiper_DigitFont_static_0500 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_DigitFont_static_0500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_DigitFont_static_0500 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_DigitFont_static_0500 component obj.$attrs.digitFont is: " +
          // JSON.stringify(obj.getElement('$attrs').getElement('digitFont')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_DigitFont_static_0500 component obj2 is: " +
          JSON.stringify(obj2));
          // expect(obj2.getElement('fontSize'))
          //   .assertEqual(swiperDefaultFontSize($r('sys.float.ohos_id_text_size_body2')));
          expect(obj2.getString('fontWeight')).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Swiper_DigitFont_static_0500 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_DigitFont_static_0500 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_DigitFont_static_0600
     * @tc.name     ArkUX_Stage_Swiper_DigitFont_static_0600
     * @tc.desc     ArkUX_Stage_Swiper_DigitFont_static_0600
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_DigitFont_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_DigitFont_static_0600 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_DigitFont_0600');
          console.info('ArkUX_Stage_Swiper_DigitFont_static_0600 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_DigitFont_static_0600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_DigitFont_static_0600 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_DigitFont_static_0600 component obj.$attrs.digitFont is: " +
          // JSON.stringify(obj.getElement('$attrs').getElement('digitFont')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_DigitFont_static_0600 component obj2 is: " +
          JSON.stringify(obj2));
          // expect(obj2.getElement('fontSize'))
          //   .assertEqual(swiperDefaultFontSize($r('sys.float.ohos_id_text_size_body2')));
          expect(obj2.getString('fontWeight')).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Swiper_DigitFont_static_0600 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_DigitFont_static_0600 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_DigitFont_static_0700
     * @tc.name     ArkUX_Stage_Swiper_DigitFont_static_0700
     * @tc.desc     ArkUX_Stage_Swiper_DigitFont_static_0700
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_DigitFont_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_DigitFont_static_0700 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_DigitFont_0700');
          console.info('ArkUX_Stage_Swiper_DigitFont_static_0700 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_DigitFont_static_0700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_DigitFont_static_0700 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_DigitFont_static_0700 component obj.$attrs.digitFont is: " +
          // JSON.stringify(obj.getElement('$attrs').getElement('digitFont')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_DigitFont_static_0700 component obj2 is: " +
          JSON.stringify(obj2));
          // expect(obj2.getElement('fontSize'))
          //   .assertEqual(swiperDefaultFontSize($r('sys.float.ohos_id_text_size_body2')));
          expect(obj2.getString('fontWeight')).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Swiper_DigitFont_static_0700 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_DigitFont_static_0700 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_DigitFont_static_0800
     * @tc.name     ArkUX_Stage_Swiper_DigitFont_static_0800
     * @tc.desc     ArkUX_Stage_Swiper_DigitFont_static_0800
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_DigitFont_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_DigitFont_static_0800 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_DigitFont_0800');
          console.info('ArkUX_Stage_Swiper_DigitFont_static_0800 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_DigitFont_static_0800 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_DigitFont_static_0800 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_DigitFont_static_0800 component obj.$attrs.digitFont is: " +
          // JSON.stringify(obj.getElement('$attrs').getElement('digitFont')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_DigitFont_static_0800 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('fontSize')).assertEqual("100.00vp");
          expect(obj2.getString('fontWeight')).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Swiper_DigitFont_static_0800 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_DigitFont_static_0800 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_DigitFont_static_0900
     * @tc.name     ArkUX_Stage_Swiper_DigitFont_static_0900
     * @tc.desc     ArkUX_Stage_Swiper_DigitFont_static_0900
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_DigitFont_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_DigitFont_static_0900 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_DigitFont_0900');
          console.info('ArkUX_Stage_Swiper_DigitFont_static_0900 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_DigitFont_static_0900 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_DigitFont_static_0900 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_DigitFont_static_0900 component obj.$attrs.digitFont is: " +
          // JSON.stringify(obj.getElement('$attrs').getElement('digitFont')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_DigitFont_static_0900 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('fontSize')).assertEqual("40.00lpx");
          expect(obj2.getString('fontWeight')).assertEqual("500");
          console.info('ArkUX_Stage_Swiper_DigitFont_static_0900 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_DigitFont_static_0900 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_DigitFont_static_1000
     * @tc.name     ArkUX_Stage_Swiper_DigitFont_static_1000
     * @tc.desc     ArkUX_Stage_Swiper_DigitFont_static_1000
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_DigitFont_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_DigitFont_static_1000 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_DigitFont_1000');
          console.info('ArkUX_Stage_Swiper_DigitFont_static_1000 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_DigitFont_static_1000 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_DigitFont_static_1000 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_DigitFont_static_1000 component obj.$attrs.digitFont is: " +
          // JSON.stringify(obj.getElement('$attrs').getElement('digitFont')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_DigitFont_static_1000 component obj2 is: " +
          JSON.stringify(obj2));
          // expect(obj2.getElement('fontSize'))
          //   .assertEqual(swiperDefaultFontSize($r('sys.float.ohos_id_text_size_body2')));
          expect(obj2.getString('fontWeight')).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Swiper_DigitFont_static_1000 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_DigitFont_static_1000 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_DigitFont_static_1100
     * @tc.name     ArkUX_Stage_Swiper_DigitFont_static_1100
     * @tc.desc     ArkUX_Stage_Swiper_DigitFont_static_1100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_DigitFont_static_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_DigitFont_static_1100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_DigitFont_1100');
          console.info('ArkUX_Stage_Swiper_DigitFont_static_1100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_DigitFont_static_1100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_DigitFont_static_1100 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_DigitFont_static_1100 component obj.$attrs.digitFont is: " +
          // JSON.stringify(obj.getElement('$attrs').getElement('digitFont')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_DigitFont_static_1100 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('fontSize')).assertEqual("10.00fp");
          expect(obj2.getString('fontWeight')).assertEqual("600");
          console.info('ArkUX_Stage_Swiper_DigitFont_static_1100 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_DigitFont_static_1100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_Indicator_static_0100
     * @tc.name     ArkUX_Stage_Swiper_Indicator_static_0100
     * @tc.desc     ArkUX_Stage_Swiper_Indicator_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_Indicator_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_Indicator_static_0100 START');
      // setTimeout(() => {
      //   try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_Indicator_0100');
          console.info('ArkUX_Stage_Swiper_Indicator_static_0100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_Indicator_static_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_Indicator_static_0100 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          // console.info("ArkUX_Stage_Swiper_Indicator_static_0100 component obj2 is: " +
          // JSON.stringify(obj2));
          expect(Number.parseFloat(obj2.getString('top'))).assertEqual(1);
          console.info("ArkUX_Stage_Swiper_Indicator_static_0100 component obj2.indicator.top is: " +
          JSON.stringify(obj2.getElement('top')));
          expect(obj2.getString('top').substr(obj2.getString('top').length - 2, 2)).assertEqual("vp");
          console.info('ArkUX_Stage_Swiper_Indicator_static_0100 END ');
          done();
      //   } catch (err: Error) {
      //     expect().assertFail();
      //     console.info('ArkUX_Stage_Swiper_Indicator_static_0100 ERR  ' + JSON.stringify(err));
      //     done();
      //   }
      // }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_Indicator_static_0200
     * @tc.name     ArkUX_Stage_Swiper_Indicator_static_0200
     * @tc.desc     ArkUX_Stage_Swiper_Indicator_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_Indicator_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_Indicator_static_0200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_Indicator_0200');
          console.info('ArkUX_Stage_Swiper_Indicator_static_0200 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_Indicator_static_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_Indicator_static_0200 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_Indicator_static_0200 component obj2 is: " +
          JSON.stringify(obj2));
          expect(Number.parseFloat(obj2.getString('bottom'))).assertEqual(1);
          expect(obj2.getString('bottom').substr(obj2.getString('bottom').length - 2, 2)).assertEqual("vp");
          console.info('ArkUX_Stage_Swiper_Indicator_static_0200 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_Indicator_static_0200 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_Indicator_static_0300
     * @tc.name     ArkUX_Stage_Swiper_Indicator_static_0300
     * @tc.desc     ArkUX_Stage_Swiper_Indicator_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_Indicator_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_Indicator_static_0300 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_Indicator_0300');
          console.info('ArkUX_Stage_Swiper_Indicator_static_0300 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_Indicator_static_0300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_Indicator_static_0300 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_Indicator_static_0300 component obj2 is: " +
          JSON.stringify(obj2));
          expect(Number.parseFloat(obj2.getString('left'))).assertEqual(1);
          expect(obj2.getString('left').substr(obj2.getString('left').length - 2, 2)).assertEqual("vp");
          console.info('ArkUX_Stage_Swiper_Indicator_static_0300 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_Indicator_static_0300 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_Indicator_static_0400
     * @tc.name     ArkUX_Stage_Swiper_Indicator_static_0400
     * @tc.desc     ArkUX_Stage_Swiper_Indicator_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_Indicator_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_Indicator_static_0400 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_Indicator_0400');
          console.info('ArkUX_Stage_Swiper_Indicator_static_0400 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_Indicator_static_0400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_Indicator_static_0400 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_Indicator_static_0400 component obj2 is: " +
          JSON.stringify(obj2));
          expect(Number.parseFloat(obj2.getString('right'))).assertEqual(1);
          expect(obj2.getString('right').substr(obj2.getString('right').length - 2, 2)).assertEqual("vp");
          console.info('ArkUX_Stage_Swiper_Indicator_static_0400 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_Indicator_static_0400 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });
  })
}