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
import { ArrowStyle } from '@ohos.arkui.component';
import events_emitter from '@ohos.events.emitter';
import { UtilsTest, startAbility } from '../Util.test';
import { RecordData } from '@ohos.base';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;
let emitKey = "emitUserAgent";

function sleep(time: int) {
  return new Promise<string>((resolve, reject) => {
    setTimeout(() => {
      resolve("ok")
    }, time)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}

async function setArrowStyle(arrowStyle: ArrowStyle) {
  try {
    let backData: events_emitter.EventData = {
      data: {
        "arrowStyle": JSON.stringify(arrowStyle)
      } as Record<String,RecordData>
    }
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

export default function swiperTest() {
  describe('ActSwiperTest', () => {
    beforeAll(() => {
      console.info("swiperTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.swiper.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Swiper/Swiper1",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router;
        router.clear();
        let pages = router.getState();
        if (!("Swiper1" == pages.name)) {
          router.pushUrl(options)
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
     * @tc.number   ArkUX_Stage_Swiper_SelectedItemWidth_static_0100
     * @tc.name     ArkUX_Stage_Swiper_SelectedItemWidth_static_0100
     * @tc.desc     ArkUX_Stage_Swiper_SelectedItemWidth_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_SelectedItemWidth_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_SelectedItemWidth_static_0100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_SelectedItemWidth_0100');
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_static_0100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_static_0100 component obj is: " +
          JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_static_0100 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_SelectedItemWidth_static_0100 component obj.getElement('$attrs').getElement('selectedItemWidth') is: " +
          // JSON.stringify(obj.getElement('$attrs').getString('selectedItemWidth')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_static_0100 component obj2 is: " +
          JSON.stringifyJsonElement(obj2));
          expect(obj2.getString('selectedItemWidth')).assertEqual("5.00vp");
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_static_0100 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_static_0100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    
    /**
     * @tc.number   ArkUX_Stage_Swiper_SelectedItemWidth_static_0200
     * @tc.name     ArkUX_Stage_Swiper_SelectedItemWidth_static_0200
     * @tc.desc     ArkUX_Stage_Swiper_SelectedItemWidth_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_SelectedItemWidth_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_SelectedItemWidth_static_0200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_SelectedItemWidth_0200');
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_static_0200 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_static_0200 component obj is: " +
          JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_static_0200 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_SelectedItemWidth_static_0200 component obj.getElement('$attrs').getElement('selectedItemWidth') is: " +
          // JSON.stringify(obj.getElement('$attrs').getElement('selectedItemWidth')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_static_0200 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('selectedItemWidth')).assertEqual("6.00vp");
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_static_0200 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_static_0200 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_SelectedItemWidth_static_0300
     * @tc.name     ArkUX_Stage_Swiper_SelectedItemWidth_static_0300
     * @tc.desc     ArkUX_Stage_Swiper_SelectedItemWidth_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_SelectedItemWidth_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_SelectedItemWidth_static_0300 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_SelectedItemWidth_0300');
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_static_0300 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_static_0300 component obj is: " +
          JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_static_0300 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_SelectedItemWidth_static_0300 component obj.getElement('$attrs').getElement('selectedItemWidth') is: " +
          // JSON.stringify(obj.getElement('$attrs').getElement('selectedItemWidth')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_static_0300 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('selectedItemWidth')).assertEqual("9999.00vp");
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_static_0300 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_static_0300 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_SelectedItemWidth_static_0400
     * @tc.name     ArkUX_Stage_Swiper_SelectedItemWidth_static_0400
     * @tc.desc     ArkUX_Stage_Swiper_SelectedItemWidth_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_SelectedItemWidth_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_SelectedItemWidth_static_0400 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_SelectedItemWidth_0400');
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_static_0400 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_static_0400 component obj is: " +
          JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_static_0400 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_SelectedItemWidth_static_0400 component obj.getElement('$attrs').getElement('selectedItemWidth') is: " +
          // JSON.stringify(obj.getElement('$attrs').getElement('selectedItemWidth')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_static_0400 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('selectedItemWidth')).assertEqual("6.00vp");
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_static_0400 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_static_0400 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_SelectedItemWidth_static_0500
     * @tc.name     ArkUX_Stage_Swiper_SelectedItemWidth_static_0500
     * @tc.desc     ArkUX_Stage_Swiper_SelectedItemWidth_static_0500
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_SelectedItemWidth_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_SelectedItemWidth_static_0500 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_SelectedItemWidth_0500');
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_static_0500 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_static_0500 component obj is: " +
          JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_static_0500 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_SelectedItemWidth_static_0500 component obj.getElement('$attrs').getElement('selectedItemWidth') is: " +
          // JSON.stringify(obj.getElement('$attrs').getElement('selectedItemWidth')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_static_0500 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('selectedItemWidth')).assertEqual("6.00vp");
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_static_0500 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_static_0500 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_SelectedItemWidth_static_0600
     * @tc.name     ArkUX_Stage_Swiper_SelectedItemWidth_static_0600
     * @tc.desc     ArkUX_Stage_Swiper_SelectedItemWidth_static_0600
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_SelectedItemWidth_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_SelectedItemWidth_static_0600 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_SelectedItemWidth_0600');
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_static_0600 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_static_0600 component obj is: " +
          JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_static_0600 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_SelectedItemWidth_static_0600 component obj.getElement('$attrs').getElement('selectedItemWidth') is: " +
          // JSON.stringify(obj.getElement('$attrs').getElement('selectedItemWidth')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_static_0600 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('selectedItemWidth')).assertEqual("6.00vp");
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_static_0600 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_static_0600 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_SelectedItemWidth_static_0700
     * @tc.name     ArkUX_Stage_Swiper_SelectedItemWidth_static_0700
     * @tc.desc     ArkUX_Stage_Swiper_SelectedItemWidth_static_0700
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_SelectedItemWidth_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_SelectedItemWidth_static_0700 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_SelectedItemWidth_0700');
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_static_0700 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_static_0700 component obj is: " +
          JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_static_0700 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_SelectedItemWidth_static_0700 component obj.getElement('$attrs').getElement('selectedItemWidth') is: " +
          // JSON.stringify(obj.getElement('$attrs').getElement('selectedItemWidth')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_static_0700 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('selectedItemWidth')).assertEqual("8.00fp");
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_static_0700 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_static_0700 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_SelectedItemWidth_static_0800
     * @tc.name     ArkUX_Stage_Swiper_SelectedItemWidth_static_0800
     * @tc.desc     ArkUX_Stage_Swiper_SelectedItemWidth_static_0800
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_SelectedItemWidth_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_SelectedItemWidth_static_0800 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_SelectedItemWidth_0800');
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_static_0800 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_static_0800 component obj is: " +
          JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_static_0800 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_SelectedItemWidth_static_0800 component obj.getElement('$attrs').getElement('selectedItemWidth') is: " +
          // JSON.stringify(obj.getElement('$attrs').getElement('selectedItemWidth')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_static_0800 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('selectedItemWidth')).assertEqual("8.00lpx");
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_static_0800 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_static_0800 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_SelectedItemHeight_static_0100
     * @tc.name     ArkUX_Stage_Swiper_SelectedItemHeight_static_0100
     * @tc.desc     ArkUX_Stage_Swiper_SelectedItemHeight_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_SelectedItemHeight_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_SelectedItemHeight_static_0100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_SelectedItemHeight_0100');
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_static_0100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_static_0100 component obj is: " +
          JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_static_0100 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_SelectedItemHeight_static_0100 component obj.getElement('$attrs').getString('selectedItemHeight') is: " +
          // JSON.stringify(obj.getElement('$attrs').getString('selectedItemHeight')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_static_0100 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('selectedItemHeight')).assertEqual("3.00vp");
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_static_0100 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_static_0100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_SelectedItemHeight_static_0200
     * @tc.name     ArkUX_Stage_Swiper_SelectedItemHeight_static_0200
     * @tc.desc     ArkUX_Stage_Swiper_SelectedItemHeight_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_SelectedItemHeight_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_SelectedItemHeight_static_0200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_SelectedItemHeight_0200');
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_static_0200 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_static_0200 component obj is: " +
          JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_static_0200 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_SelectedItemHeight_static_0200 component obj.getElement('$attrs').getString('selectedItemHeight') is: " +
          // JSON.stringify(obj.getElement('$attrs').getString('selectedItemHeight')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_static_0200 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('selectedItemHeight')).assertEqual("6.00vp");
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_static_0200 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_static_0200 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_SelectedItemHeight_static_0300
     * @tc.name     ArkUX_Stage_Swiper_SelectedItemHeight_static_0300
     * @tc.desc     ArkUX_Stage_Swiper_SelectedItemHeight_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_SelectedItemHeight_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_SelectedItemHeight_static_0300 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_SelectedItemHeight_0300');
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_static_0300 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_static_0300 component obj is: " +
          JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_static_0300 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_SelectedItemHeight_static_0300 component obj.getElement('$attrs').getString('selectedItemHeight') is: " +
          // JSON.stringify(obj.getElement('$attrs').getString('selectedItemHeight')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_static_0300 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('selectedItemHeight')).assertEqual("9999.00fp");
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_static_0300 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_static_0300 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_SelectedItemHeight_static_0400
     * @tc.name     ArkUX_Stage_Swiper_SelectedItemHeight_static_0400
     * @tc.desc     ArkUX_Stage_Swiper_SelectedItemHeight_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_SelectedItemHeight_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_SelectedItemHeight_static_0400 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_SelectedItemHeight_0400');
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_static_0400 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_static_0400 component obj is: " +
          JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_static_0400 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_SelectedItemHeight_static_0400 component obj.getElement('$attrs').getString('selectedItemHeight') is: " +
          // JSON.stringify(obj.getElement('$attrs').getString('selectedItemHeight')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_static_0400 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('selectedItemHeight')).assertEqual("6.00vp");
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_static_0400 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_static_0400 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_SelectedItemHeight_static_0500
     * @tc.name     ArkUX_Stage_Swiper_SelectedItemHeight_static_0500
     * @tc.desc     ArkUX_Stage_Swiper_SelectedItemHeight_static_0500
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_SelectedItemHeight_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_SelectedItemHeight_static_0500 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_SelectedItemHeight_0500');
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_static_0500 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_static_0500 component obj is: " +
          JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_static_0500 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_SelectedItemHeight_static_0500 component obj.getElement('$attrs').getString('selectedItemHeight') is: " +
          // JSON.stringify(obj.getElement('$attrs').getString('selectedItemHeight')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_static_0500 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('selectedItemHeight')).assertEqual("6.00vp");
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_static_0500 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_static_0500 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_SelectedItemHeight_static_0600
     * @tc.name     ArkUX_Stage_Swiper_SelectedItemHeight_static_0600
     * @tc.desc     ArkUX_Stage_Swiper_SelectedItemHeight_static_0600
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_SelectedItemHeight_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_SelectedItemHeight_static_0600 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_SelectedItemHeight_0600');
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_static_0600 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_static_0600 component obj is: " +
          JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_static_0600 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_SelectedItemHeight_static_0600 component obj.getElement('$attrs').getString('selectedItemHeight') is: " +
          // JSON.stringify(obj.getElement('$attrs').getString('selectedItemHeight')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_static_0600 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('selectedItemHeight')).assertEqual("6.00vp");
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_static_0600 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_static_0600 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_SelectedItemHeight_static_0700
     * @tc.name     ArkUX_Stage_Swiper_SelectedItemHeight_static_0700
     * @tc.desc     ArkUX_Stage_Swiper_SelectedItemHeight_static_0700
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_SelectedItemHeight_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_SelectedItemHeight_static_0700 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_SelectedItemHeight_0700');
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_static_0700 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_static_0700 component obj is: " +
          JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_static_0700 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_SelectedItemHeight_static_0700 component obj.getElement('$attrs').getString('selectedItemHeight') is: " +
          // JSON.stringify(obj.getElement('$attrs').getString('selectedItemHeight')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_static_0700 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('selectedItemHeight')).assertEqual("8.00vp");
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_static_0700 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_static_0700 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_SelectedItemHeight_static_0800
     * @tc.name     ArkUX_Stage_Swiper_SelectedItemHeight_static_0800
     * @tc.desc     ArkUX_Stage_Swiper_SelectedItemHeight_static_0800
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_SelectedItemHeight_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_SelectedItemHeight_static_0800 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_SelectedItemHeight_0800');
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_static_0800 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_static_0800 component obj is: " +
          JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_static_0800 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_SelectedItemHeight_static_0800 component obj.getElement('$attrs').getString('selectedItemHeight') is: " +
          // JSON.stringify(obj.getElement('$attrs').getString('selectedItemHeight')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_static_0800 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('selectedItemHeight')).assertEqual("8.00lpx");
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_static_0800 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_static_0800 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_ItemWidth_static_0100
     * @tc.name     ArkUX_Stage_Swiper_ItemWidth_static_0100
     * @tc.desc     ArkUX_Stage_Swiper_ItemWidth_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_ItemWidth_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_ItemWidth_static_0100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_ItemWidth_0100');
          console.info('ArkUX_Stage_Swiper_ItemWidth_static_0100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_ItemWidth_static_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_ItemWidth_static_0100 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_ItemWidth_static_0100 component obj.getElement('$attrs').getString('itemWidth') is: " +
          // JSON.stringify(obj.getElement('$attrs').getString('itemWidth')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_ItemWidth_static_0100 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('itemWidth')).assertEqual("3.00vp");
          console.info('ArkUX_Stage_Swiper_ItemWidth_static_0100 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_ItemWidth_static_0100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_ItemWidth_static_0200
     * @tc.name     ArkUX_Stage_Swiper_ItemWidth_static_0200
     * @tc.desc     ArkUX_Stage_Swiper_ItemWidth_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_ItemWidth_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_ItemWidth_static_0200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_ItemWidth_0200');
          console.info('ArkUX_Stage_Swiper_ItemWidth_static_0200 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_ItemWidth_static_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_ItemWidth_static_0200 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_ItemWidth_static_0200 component obj.getElement('$attrs').getString('itemWidth') is: " +
          // JSON.stringify(obj.getElement('$attrs').getString('itemWidth')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_ItemWidth_static_0100 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('itemWidth')).assertEqual("6.00vp");
          console.info('ArkUX_Stage_Swiper_ItemWidth_static_0200 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_ItemWidth_static_0200 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_ItemWidth_static_0300
     * @tc.name     ArkUX_Stage_Swiper_ItemWidth_static_0300
     * @tc.desc     ArkUX_Stage_Swiper_ItemWidth_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_ItemWidth_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_ItemWidth_static_0300 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_ItemWidth_0300');
          console.info('ArkUX_Stage_Swiper_ItemWidth_static_0300 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_ItemWidth_static_0300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_ItemWidth_static_0300 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_ItemWidth_static_0300 component obj.getElement('$attrs').getString('itemWidth') is: " +
          // JSON.stringify(obj.getElement('$attrs').getString('itemWidth')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_ItemWidth_static_0300 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('itemWidth')).assertEqual("9999.00lpx");
          console.info('ArkUX_Stage_Swiper_ItemWidth_static_0300 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_ItemWidth_static_0300 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_ItemWidth_static_0400
     * @tc.name     ArkUX_Stage_Swiper_ItemWidth_static_0400
     * @tc.desc     ArkUX_Stage_Swiper_ItemWidth_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_ItemWidth_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_ItemWidth_static_0400 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_ItemWidth_0400');
          console.info('ArkUX_Stage_Swiper_ItemWidth_static_0400 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_ItemWidth_static_0400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_ItemWidth_static_0400 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_ItemWidth_static_0400 component obj.getElement('$attrs').getString('itemWidth') is: " +
          // JSON.stringify(obj.getElement('$attrs').getString('itemWidth')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_ItemWidth_static_0400 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('itemWidth')).assertEqual("6.00vp");
          console.info('ArkUX_Stage_Swiper_ItemWidth_static_0400 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_ItemWidth_static_0400 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_ItemWidth_static_0500
     * @tc.name     ArkUX_Stage_Swiper_ItemWidth_static_0500
     * @tc.desc     ArkUX_Stage_Swiper_ItemWidth_static_0500
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_ItemWidth_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_ItemWidth_static_0500 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_ItemWidth_0500');
          console.info('ArkUX_Stage_Swiper_ItemWidth_static_0500 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_ItemWidth_static_0500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_ItemWidth_static_0500 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_ItemWidth_static_0500 component obj.getElement('$attrs').getString('itemWidth') is: " +
          // JSON.stringify(obj.getElement('$attrs').getString('itemWidth')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_ItemWidth_static_0500 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('itemWidth')).assertEqual("6.00vp");
          console.info('ArkUX_Stage_Swiper_ItemWidth_static_0500 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_ItemWidth_static_0500 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_ItemWidth_static_0600
     * @tc.name     ArkUX_Stage_Swiper_ItemWidth_static_0600
     * @tc.desc     ArkUX_Stage_Swiper_ItemWidth_static_0600
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_ItemWidth_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_ItemWidth_static_0600 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_ItemWidth_0600');
          console.info('ArkUX_Stage_Swiper_ItemWidth_static_0600 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_ItemWidth_static_0600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_ItemWidth_static_0600 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_ItemWidth_static_0600 component obj.getElement('$attrs').getString('itemWidth') is: " +
          // JSON.stringify(obj.getElement('$attrs').getString('itemWidth')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_ItemWidth_static_0600 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('itemWidth')).assertEqual("8.00px");
          console.info('ArkUX_Stage_Swiper_ItemWidth_static_0600 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_ItemWidth_static_0600 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_ItemWidth_static_0700
     * @tc.name     ArkUX_Stage_Swiper_ItemWidth_static_0700
     * @tc.desc     ArkUX_Stage_Swiper_ItemWidth_static_0700
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_ItemWidth_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_ItemWidth_static_0700 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_ItemWidth_0700');
          console.info('ArkUX_Stage_Swiper_ItemWidth_static_0700 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_ItemWidth_static_0700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_ItemWidth_static_0700 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_ItemWidth_static_0700 component obj.getElement('$attrs').getString('itemWidth') is: " +
          // JSON.stringify(obj.getElement('$attrs').getString('itemWidth')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_ItemWidth_static_0700 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('itemWidth')).assertEqual("8.00fp");
          console.info('ArkUX_Stage_Swiper_ItemWidth_static_0700 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_ItemWidth_static_0700 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_ItemHeight_static_0100
     * @tc.name     ArkUX_Stage_Swiper_ItemHeight_static_0100
     * @tc.desc     ArkUX_Stage_Swiper_ItemHeight_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_ItemHeight_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_ItemHeight_static_0100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_ItemHeight_0100');
          console.info('ArkUX_Stage_Swiper_ItemHeight_static_0100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_ItemHeight_static_0100 component obj is: " +
          JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_ItemHeight_static_0100 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_ItemHeight_static_0100 component obj.getElement('$attrs').getString('itemHeight') is: " +
          // JSON.stringify(obj.getElement('$attrs').getString('itemHeight')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_ItemHeight_static_0100 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('itemHeight')).assertEqual("3.00vp");
          console.info('ArkUX_Stage_Swiper_ItemHeight_static_0100 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_ItemHeight_static_0100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_ItemHeight_static_0200
     * @tc.name     ArkUX_Stage_Swiper_ItemHeight_static_0200
     * @tc.desc     ArkUX_Stage_Swiper_ItemHeight_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_ItemHeight_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_ItemHeight_static_0200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_ItemHeight_0200');
          console.info('ArkUX_Stage_Swiper_ItemHeight_static_0200 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_ItemHeight_static_0200 component obj is: " +
          JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_ItemHeight_static_0200 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_ItemHeight_static_0200 component obj.getElement('$attrs').getString('itemHeight') is: " +
          // JSON.stringify(obj.getElement('$attrs').getString('itemHeight')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_ItemHeight_static_0200 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('itemHeight')).assertEqual("6.00vp");
          console.info('ArkUX_Stage_Swiper_ItemHeight_static_0200 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_ItemHeight_static_0200 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_ItemHeight_static_0300
     * @tc.name     ArkUX_Stage_Swiper_ItemHeight_static_0300
     * @tc.desc     ArkUX_Stage_Swiper_ItemHeight_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_ItemHeight_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_ItemHeight_static_0300 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_ItemHeight_0300');
          console.info('ArkUX_Stage_Swiper_ItemHeight_static_0300 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_ItemHeight_static_0300 component obj is: " +
          JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_ItemHeight_static_0300 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_ItemHeight_static_0300 component obj.getElement('$attrs').getString('itemHeight') is: " +
          // JSON.stringify(obj.getElement('$attrs').getString('itemHeight')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_ItemHeight_static_0300 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('itemHeight')).assertEqual("9999.00vp");
          console.info('ArkUX_Stage_Swiper_ItemHeight_static_0300 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_ItemHeight_static_0300 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_ItemHeight_static_0400
     * @tc.name     ArkUX_Stage_Swiper_ItemHeight_static_0400
     * @tc.desc     ArkUX_Stage_Swiper_ItemHeight_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_ItemHeight_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_ItemHeight_static_0400 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_ItemHeight_0400');
          console.info('ArkUX_Stage_Swiper_ItemHeight_static_0400 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_ItemHeight_static_0400 component obj is: " +
          JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_ItemHeight_static_0400 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_ItemHeight_static_0400 component obj.getElement('$attrs').getString('itemHeight') is: " +
          // JSON.stringify(obj.getElement('$attrs').getString('itemHeight')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_ItemHeight_static_0400 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('itemHeight')).assertEqual("6.00vp");
          console.info('ArkUX_Stage_Swiper_ItemHeight_static_0400 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_ItemHeight_static_0400 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_ItemHeight_static_0500
     * @tc.name     ArkUX_Stage_Swiper_ItemHeight_static_0500
     * @tc.desc     ArkUX_Stage_Swiper_ItemHeight_static_0500
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_ItemHeight_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_ItemHeight_static_0500 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_ItemHeight_0500');
          console.info('ArkUX_Stage_Swiper_ItemHeight_static_0500 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_ItemHeight_static_0500 component obj is: " +
          JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_ItemHeight_static_0500 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_ItemHeight_static_0500 component obj.getElement('$attrs').getString('itemHeight') is: " +
          // JSON.stringify(obj.getElement('$attrs').getString('itemHeight')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_ItemHeight_static_0500 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('itemHeight')).assertEqual("6.00vp");
          console.info('ArkUX_Stage_Swiper_ItemHeight_static_0500 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_ItemHeight_static_0500 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_ItemHeight_static_0600
     * @tc.name     ArkUX_Stage_Swiper_ItemHeight_static_0600
     * @tc.desc     ArkUX_Stage_Swiper_ItemHeight_static_0600
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_ItemHeight_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_ItemHeight_static_0500 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_ItemHeight_0600');
          console.info('ArkUX_Stage_Swiper_ItemHeight_static_0600 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_ItemHeight_static_0600 component obj is: " +
          JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_ItemHeight_static_0600 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_ItemHeight_static_0600 component obj.getElement('$attrs').getString('itemHeight') is: " +
          // JSON.stringify(obj.getElement('$attrs').getString('itemHeight')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_ItemHeight_static_0600 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('itemHeight')).assertEqual("8.00fp");
          console.info('ArkUX_Stage_Swiper_ItemHeight_static_0600 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_ItemHeight_static_0600 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_ItemHeight_static_0700
     * @tc.name     ArkUX_Stage_Swiper_ItemHeight_static_0700
     * @tc.desc     ArkUX_Stage_Swiper_ItemHeight_static_0700
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_ItemHeight_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_ItemHeight_static_0700 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_ItemHeight_0700');
          console.info('ArkUX_Stage_Swiper_ItemHeight_static_0700 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_ItemHeight_static_0700 component obj is: " +
          JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_ItemHeight_static_0700 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_ItemHeight_static_0700 component obj.getElement('$attrs').getString('itemHeight') is: " +
          // JSON.stringify(obj.getElement('$attrs').getString('itemHeight')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_ItemHeight_static_0700 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('itemHeight')).assertEqual("8.00lpx");
          console.info('ArkUX_Stage_Swiper_ItemHeight_static_0700 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_ItemHeight_static_0700 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_SelectedFontColor_static_0100
     * @tc.name     ArkUX_Stage_Swiper_SelectedFontColor_static_0100
     * @tc.desc     ArkUX_Stage_Swiper_SelectedFontColor_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_SelectedFontColor_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_SelectedFontColor_static_0100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_SelectedFontColor_0100');
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_static_0100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_static_0100 component obj is: " +
          JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_static_0100 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_SelectedFontColor_static_0100 component obj.getElement('$attrs').getString('selectedFontColor') is: " +
          // JSON.stringify(obj.getElement('$attrs').getString('selectedFontColor')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_static_0100 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('selectedFontColor')).assertEqual("#FF00FF00");
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_static_0100 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_static_0100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_SelectedFontColor_static_0200
     * @tc.name     ArkUX_Stage_Swiper_SelectedFontColor_static_0200
     * @tc.desc     ArkUX_Stage_Swiper_SelectedFontColor_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_SelectedFontColor_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_SelectedFontColor_static_0200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_SelectedFontColor_0200');
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_static_0200 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_static_0200 component obj is: " +
          JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_static_0200 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_SelectedFontColor_static_0200 component obj.getElement('$attrs').getString('selectedFontColor') is: " +
          // JSON.stringify(obj.getElement('$attrs').getString('selectedFontColor')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_static_0200 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('selectedFontColor')).assertEqual("#FFFF0000");
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_static_0200 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_static_0200 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_SelectedFontColor_static_0300
     * @tc.name     ArkUX_Stage_Swiper_SelectedFontColor_static_0300
     * @tc.desc     ArkUX_Stage_Swiper_SelectedFontColor_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_SelectedFontColor_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_SelectedFontColor_static_0300 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_SelectedFontColor_0300');
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_static_0300 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_static_0300 component obj is: " +
          JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_static_0300 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_SelectedFontColor_static_0300 component obj.getElement('$attrs').getString('selectedFontColor') is: " +
          // JSON.stringify(obj.getElement('$attrs').getString('selectedFontColor')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_static_0300 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('selectedFontColor')).assertEqual("#FF8A2BE2");
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_static_0300 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_static_0300 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_SelectedFontColor_static_0400
     * @tc.name     ArkUX_Stage_Swiper_SelectedFontColor_static_0400
     * @tc.desc     ArkUX_Stage_Swiper_SelectedFontColor_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_SelectedFontColor_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_SelectedFontColor_static_0400 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_SelectedFontColor_0400');
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_static_0400 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_static_0400 component obj is: " +
          JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_static_0400 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_SelectedFontColor_static_0400 component obj.getElement('$attrs').getString('selectedFontColor') is: " +
          // JSON.stringify(obj.getElement('$attrs').getString('selectedFontColor')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_static_0400 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('selectedFontColor')).assertEqual("#FFFFC0CB");
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_static_0400 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_static_0400 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_SelectedFontColor_static_0500
     * @tc.name     ArkUX_Stage_Swiper_SelectedFontColor_static_0500
     * @tc.desc     ArkUX_Stage_Swiper_SelectedFontColor_static_0500
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_SelectedFontColor_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_SelectedFontColor_static_0500 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_SelectedFontColor_0500');
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_static_0500 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_static_0500 component obj is: " +
          JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_static_0500 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_SelectedFontColor_static_0500 component obj.getElement('$attrs').getString('selectedFontColor') is: " +
          // JSON.stringify(obj.getElement('$attrs').getString('selectedFontColor')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_static_0500 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('selectedFontColor')).assertEqual(obj.getElement('$attrs').getString('borderColor'));
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_static_0500 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_static_0500 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_SelectedFontColor_static_0600
     * @tc.name     ArkUX_Stage_Swiper_SelectedFontColor_static_0600
     * @tc.desc     ArkUX_Stage_Swiper_SelectedFontColor_static_0600
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_SelectedFontColor_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_SelectedFontColor_static_0600 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_SelectedFontColor_0600');
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_static_0600 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_static_0600 component obj is: " +
          JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_static_0600 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_SelectedFontColor_static_0600 component obj.getElement('$attrs').getString('selectedFontColor') is: " +
          // JSON.stringify(obj.getElement('$attrs').getString('selectedFontColor')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_static_0600 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('selectedFontColor')).assertEqual(obj.getElement('$attrs').getString('borderColor'));
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_static_0600 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_static_0600 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_SelectedFontColor_static_0700
     * @tc.name     ArkUX_Stage_Swiper_SelectedFontColor_static_0700
     * @tc.desc     ArkUX_Stage_Swiper_SelectedFontColor_static_0700
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_SelectedFontColor_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_SelectedFontColor_static_0700 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_SelectedFontColor_0700');
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_static_0700 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_static_0700 component obj is: " +
          JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_static_0700 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_SelectedFontColor_static_0700 component obj.getElement('$attrs').getString('selectedFontColor') is: " +
          // JSON.stringify(obj.getElement('$attrs').getString('selectedFontColor')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_static_0700 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('selectedFontColor')).assertEqual("#FFFF0000");
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_static_0700 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_static_0700 ERR  ' + JSON.stringify(err));
          done();
        }
        done();
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_SelectedFontColor_static_0800
     * @tc.name     ArkUX_Stage_Swiper_SelectedFontColor_static_0800
     * @tc.desc     ArkUX_Stage_Swiper_SelectedFontColor_static_0800
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_SelectedFontColor_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_SelectedFontColor_static_0800 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_SelectedFontColor_0800');
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_static_0800 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_static_0800 component obj is: " +
          JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_static_0800 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_SelectedFontColor_static_0800 component obj.getElement('$attrs').getString('selectedFontColor') is: " +
          // JSON.stringify(obj.getElement('$attrs').getString('selectedFontColor')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_static_0800 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('selectedFontColor')).assertEqual(obj.getElement('$attrs').getString('borderColor'));
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_static_0800 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_static_0800 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_SelectedFontColor_static_0900
     * @tc.name     ArkUX_Stage_Swiper_SelectedFontColor_static_0900
     * @tc.desc     ArkUX_Stage_Swiper_SelectedFontColor_static_0900
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_SelectedFontColor_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_SelectedFontColor_static_0900 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_SelectedFontColor_0600');
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_static_0900 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_static_0900 component obj is: " +
          JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_static_0900 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_SelectedFontColor_static_0900 component obj.getElement('$attrs').getString('selectedFontColor') is: " +
          // JSON.stringify(obj.getElement('$attrs').getString('selectedFontColor')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_static_0900 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('selectedFontColor')).assertEqual(obj.getElement('$attrs').getString('borderColor'));
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_static_0900 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_static_0900 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_SelectedFontColor_static_1000
     * @tc.name     ArkUX_Stage_Swiper_SelectedFontColor_static_1000
     * @tc.desc     ArkUX_Stage_Swiper_SelectedFontColor_static_1000
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_SelectedFontColor_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_SelectedFontColor_static_1000 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_SelectedFontColor_1000');
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_static_1000 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_static_1000 component obj is: " +
          JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_static_1000 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_SelectedFontColor_static_1000 component obj.getElement('$attrs').getString('selectedFontColor') is: " +
          // JSON.stringify(obj.getElement('$attrs').getString('selectedFontColor')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_static_1000 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('selectedFontColor')).assertEqual("#FF808080");
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_static_1000 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_static_1000 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_SelectedFontColor_static_1100
     * @tc.name     ArkUX_Stage_Swiper_SelectedFontColor_static_1100
     * @tc.desc     ArkUX_Stage_Swiper_SelectedFontColor_static_1100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_SelectedFontColor_static_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_SelectedFontColor_static_1100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_SelectedFontColor_1100');
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_static_1100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_static_1100 component obj is: " +
          JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_static_1100 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_SelectedFontColor_static_1100 component obj.getElement('$attrs').getString('selectedFontColor') is: " +
          // JSON.stringify(obj.getElement('$attrs').getString('selectedFontColor')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_static_1100 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('selectedFontColor')).assertEqual("#FF00FF00");
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_static_1100 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_static_1100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_SelectedFontColor_static_1200
     * @tc.name     ArkUX_Stage_Swiper_SelectedFontColor_static_1200
     * @tc.desc     ArkUX_Stage_Swiper_SelectedFontColor_static_1200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_SelectedFontColor_static_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_SelectedFontColor_static_1200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_SelectedFontColor_1200');
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_static_1200 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_static_1200 component obj is: " +
          JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_static_1200 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_SelectedFontColor_static_1200 component obj.getElement('$attrs').getString('selectedFontColor') is: " +
          // JSON.stringify(obj.getElement('$attrs').getString('selectedFontColor')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_static_1200 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('selectedFontColor')).assertEqual(obj.getElement('$attrs').getString('borderColor'));
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_static_1200 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_static_1200 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_FontColor_static_0100
     * @tc.name     ArkUX_Stage_Swiper_FontColor_static_0100
     * @tc.desc     ArkUX_Stage_Swiper_FontColor_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_FontColor_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_FontColor_static_0100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_FontColor_0100');
          console.info('ArkUX_Stage_Swiper_FontColor_static_0100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_FontColor_static_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_FontColor_static_0100 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_FontColor_static_0100 component obj.getElement('$attrs').getString('fontColor') is: " +
          // JSON.stringify(obj.getElement('$attrs').getString('fontColor')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_FontColor_static_0100 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('fontColor')).assertEqual("#FF00FF00");
          console.info('ArkUX_Stage_Swiper_FontColor_static_0100 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_FontColor_static_0100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_FontColor_static_0200
     * @tc.name     ArkUX_Stage_Swiper_FontColor_static_0200
     * @tc.desc     ArkUX_Stage_Swiper_FontColor_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_FontColor_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_FontColor_static_0200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_FontColor_0200');
          console.info('ArkUX_Stage_Swiper_FontColor_static_0200 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_FontColor_static_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_FontColor_static_0200 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_FontColor_static_0200 component obj.getElement('$attrs').getString('fontColor') is: " +
          // JSON.stringify(obj.getElement('$attrs').getString('fontColor')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_FontColor_static_0200 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('fontColor')).assertEqual("#FFFF0000");
          console.info('ArkUX_Stage_Swiper_FontColor_static_0200 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_FontColor_static_0200 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_FontColor_static_0300
     * @tc.name     ArkUX_Stage_Swiper_FontColor_static_0300
     * @tc.desc     ArkUX_Stage_Swiper_FontColor_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_FontColor_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_FontColor_static_0300 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_FontColor_0300');
          console.info('ArkUX_Stage_Swiper_FontColor_static_0300 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_FontColor_static_0300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_FontColor_static_0300 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_FontColor_static_0300 component obj.getElement('$attrs').getString('fontColor') is: " +
          // JSON.stringify(obj.getElement('$attrs').getString('fontColor')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_FontColor_static_0300 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('fontColor')).assertEqual("#FF8A2BE2");
          console.info('ArkUX_Stage_Swiper_FontColor_static_0300 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_FontColor_static_0300 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_FontColor_static_0400
     * @tc.name     ArkUX_Stage_Swiper_FontColor_static_0400
     * @tc.desc     ArkUX_Stage_Swiper_FontColor_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_FontColor_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_FontColor_static_0400 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_FontColor_0400');
          console.info('ArkUX_Stage_Swiper_FontColor_static_0400 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_FontColor_static_0400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_FontColor_static_0400 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_FontColor_static_0400 component obj.getElement('$attrs').getString('fontColor') is: " +
          // JSON.stringify(obj.getElement('$attrs').getString('fontColor')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_FontColor_static_0400 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('fontColor')).assertEqual("#FFFFC0CB");
          console.info('ArkUX_Stage_Swiper_FontColor_static_0400 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_FontColor_static_0400 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_FontColor_static_0500
     * @tc.name     ArkUX_Stage_Swiper_FontColor_static_0500
     * @tc.desc     ArkUX_Stage_Swiper_FontColor_static_0500
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_FontColor_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_FontColor_static_0500 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_FontColor_0500');
          console.info('ArkUX_Stage_Swiper_FontColor_static_0500 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_FontColor_static_0500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_FontColor_static_0500 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_FontColor_static_0500 component obj.getElement('$attrs').getString('fontColor') is: " +
          // JSON.stringify(obj.getElement('$attrs').getString('fontColor')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_FontColor_static_0500 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('fontColor')).assertEqual(obj.getElement('$attrs').getString('borderColor'));
          console.info('ArkUX_Stage_Swiper_FontColor_static_0500 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_FontColor_static_0500 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_FontColor_static_0600
     * @tc.name     ArkUX_Stage_Swiper_FontColor_static_0600
     * @tc.desc     ArkUX_Stage_Swiper_FontColor_static_0600
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_FontColor_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_FontColor_static_0600 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_FontColor_0600');
          console.info('ArkUX_Stage_Swiper_FontColor_static_0600 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_FontColor_static_0600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_FontColor_static_0600 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_FontColor_static_0600 component obj.getElement('$attrs').getString('fontColor') is: " +
          // JSON.stringify(obj.getElement('$attrs').getString('fontColor')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_FontColor_static_0600 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('fontColor')).assertEqual(obj.getElement('$attrs').getString('borderColor'));
          console.info('ArkUX_Stage_Swiper_FontColor_static_0600 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_FontColor_static_0600 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_FontColor_static_0700
     * @tc.name     ArkUX_Stage_Swiper_FontColor_static_0700
     * @tc.desc     ArkUX_Stage_Swiper_FontColor_static_0700
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_FontColor_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_FontColor_static_0700 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_FontColor_0700');
          console.info('ArkUX_Stage_Swiper_FontColor_static_0700 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_FontColor_static_0700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_FontColor_static_0700 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_FontColor_static_0700 component obj.getElement('$attrs').getString('fontColor') is: " +
          // JSON.stringify(obj.getElement('$attrs').getString('fontColor')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_FontColor_static_0700 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('fontColor')).assertEqual("#FFFF0000");
          console.info('ArkUX_Stage_Swiper_FontColor_static_0700 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_FontColor_static_0700 ERR  ' + JSON.stringify(err));
          done();
        }
        done();
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_FontColor_static_0800
     * @tc.name     ArkUX_Stage_Swiper_FontColor_static_0800
     * @tc.desc     ArkUX_Stage_Swiper_FontColor_static_0800
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_FontColor_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_FontColor_static_0800 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_FontColor_0800');
          console.info('ArkUX_Stage_Swiper_FontColor_static_0800 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_FontColor_static_0800 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_FontColor_static_0800 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_FontColor_static_0800 component obj.getElement('$attrs').getString('fontColor') is: " +
          // JSON.stringify(obj.getElement('$attrs').getString('fontColor')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_FontColor_static_0800 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('fontColor')).assertEqual(obj.getElement('$attrs').getString('borderColor'));
          console.info('ArkUX_Stage_Swiper_FontColor_static_0800 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_FontColor_static_0800 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_FontColor_static_0900
     * @tc.name     ArkUX_Stage_Swiper_FontColor_static_0900
     * @tc.desc     ArkUX_Stage_Swiper_FontColor_static_0900
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_FontColor_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_FontColor_static_0900 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_FontColor_0600');
          console.info('ArkUX_Stage_Swiper_FontColor_static_0900 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_FontColor_static_0900 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_FontColor_static_0900 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_FontColor_static_0900 component obj.getElement('$attrs').getString('fontColor') is: " +
          // JSON.stringify(obj.getElement('$attrs').getString('fontColor')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_FontColor_static_0900 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('fontColor')).assertEqual(obj.getElement('$attrs').getString('borderColor'));
          console.info('ArkUX_Stage_Swiper_FontColor_static_0900 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_FontColor_static_0900 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_FontColor_static_1000
     * @tc.name     ArkUX_Stage_Swiper_FontColor_static_1000
     * @tc.desc     ArkUX_Stage_Swiper_FontColor_static_1000
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_FontColor_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_FontColor_static_1000 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_FontColor_1000');
          console.info('ArkUX_Stage_Swiper_FontColor_static_1000 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_FontColor_static_1000 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_FontColor_static_1000 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_FontColor_static_1000 component obj.getElement('$attrs').getString('fontColor') is: " +
          // JSON.stringify(obj.getElement('$attrs').getString('fontColor')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_FontColor_static_1000 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('fontColor')).assertEqual("#FF808080");
          console.info('ArkUX_Stage_Swiper_FontColor_static_1000 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_FontColor_static_1000 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_FontColor_static_1100
     * @tc.name     ArkUX_Stage_Swiper_FontColor_static_1100
     * @tc.desc     ArkUX_Stage_Swiper_FontColor_static_1100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_FontColor_static_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_FontColor_static_1100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_FontColor_1100');
          console.info('ArkUX_Stage_Swiper_FontColor_static_1100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_FontColor_static_1100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_FontColor_static_1100 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_FontColor_static_1100 component obj.getElement('$attrs').getString('fontColor') is: " +
          // JSON.stringify(obj.getElement('$attrs').getString('fontColor')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_FontColor_static_1100 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('fontColor')).assertEqual("#FF00FF00");
          console.info('ArkUX_Stage_Swiper_FontColor_static_1100 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_FontColor_static_1100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_FontColor_static_1200
     * @tc.name     ArkUX_Stage_Swiper_FontColor_static_1200
     * @tc.desc     ArkUX_Stage_Swiper_FontColor_static_1200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_FontColor_static_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Swiper_FontColor_static_1200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Swiper_FontColor_1200');
          console.info('ArkUX_Stage_Swiper_FontColor_static_1200 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Swiper_FontColor_static_1200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_FontColor_static_1200 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          // console.info("ArkUX_Stage_Swiper_FontColor_static_1200 component obj.getElement('$attrs').getString('fontColor') is: " +
          // JSON.stringify(obj.getElement('$attrs').getString('fontColor')));
          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("ArkUX_Stage_Swiper_FontColor_static_1200 component obj2 is: " +
          JSON.stringify(obj2));
          expect(obj2.getString('fontColor')).assertEqual(obj.getElement('$attrs').getString('borderColor'));
          console.info('ArkUX_Stage_Swiper_FontColor_static_1200 END ');
          done();
        } catch (err: Error) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_FontColor_static_1200 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });
  })
}