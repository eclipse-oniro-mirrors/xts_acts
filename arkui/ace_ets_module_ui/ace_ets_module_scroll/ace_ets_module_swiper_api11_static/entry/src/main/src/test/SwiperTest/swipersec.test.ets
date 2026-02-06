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
import { ArrowStyle, Color, Resource, Length, $r } from '@ohos.arkui.component';
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
        "arrowStyle": arrowStyle as ArrowStyle
      } as Record<String,RecordData>
    }
    let backEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    console.info("setArrowStyle start send emitKey");
    console.info("setArrowStyle backData :" + JSON.stringify(backData));
    events_emitter.emit(backEvent, backData);
  } catch (err) {
    console.info("setArrowStyle emit emitKey  err: " + JSON.stringify(err));
  }
  await sleep(2000);
}

async function setBoolean(type: string, displayArrow: undefined | null | string | boolean | number) {
  try {
    if (displayArrow == null) {
      displayArrow = ''
    }
    let backData: events_emitter.EventData = {
      data: {
        "type": type,
        "displayArrow": displayArrow!
      } as Record<String,RecordData>
    }
    let backEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    console.info("setBoolean start send emitKey");
    console.info("setBoolean backData :" + JSON.stringify(backData));
    events_emitter.emit(backEvent, backData);
  } catch (err) {
    console.info("setBoolean emit emitKey  err: " + JSON.stringify(err));
  }
  await sleep(2000);
}

const SUITE: string = 'SwiperSec'
const waitUiReadyMs: number = 500;

export default function swiperSecTest() {

  describe('swiperSecTest', () => {
    beforeAll(() => {
      console.info("swiperSecTest beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.swiper.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Swiper/Swipersec",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router;
        router.clear();
        let pages = router.getState();
        if (pages == null || !("Swipersec" == pages.name)) {
          router.pushUrl(options).then(() => {
            console.info(`SwiperSec router.pushUrl success`);
          }).catch((error: Error): void => {
            console.error(`SwiperSec router.pushUrl failed, code is ${error.code}, message is ${error.message}`);
          })
        }
      } catch (err) {
        console.error(`SwiperSec beforeEach error:` + JSON.stringify(err));
      }
    });
    afterEach(async (): Promise<void> => {

      await setArrowStyle(
        {} as ArrowStyle
      )
    });


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_showBackground_static_0100
     * @tc.name     ArkUX_Stage_Swiper_showBackground_static_0100
     * @tc.desc     ArkUX_Stage_Swiper_showBackground_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_showBackground_static_0100', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          showBackground: true
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      expect(obj.getElement('$attrs').getString('showBackground')).assertEqual("true")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_showBackground_static_0200
     * @tc.name     ArkUX_Stage_Swiper_showBackground_static_0200
     * @tc.desc     ArkUX_Stage_Swiper_showBackground_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_showBackground_static_0200', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          // showBackground: 1
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      expect(obj.getElement('$attrs').getString('showBackground')).assertEqual("false")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_showBackground_static_0300
     * @tc.name     ArkUX_Stage_Swiper_showBackground_static_0300
     * @tc.desc     ArkUX_Stage_Swiper_showBackground_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_showBackground_static_0300', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          // showBackground: "true"
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      expect(obj.getElement('$attrs').getString('showBackground')).assertEqual("false")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_showBackground_static_0400
     * @tc.name     ArkUX_Stage_Swiper_showBackground_static_0400
     * @tc.desc     ArkUX_Stage_Swiper_showBackground_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_showBackground_static_0400', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          // showBackground: "false",
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      expect(obj.getElement('$attrs').getString('showBackground')).assertEqual("false")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_showBackground_static_0500
     * @tc.name     ArkUX_Stage_Swiper_showBackground_static_0500
     * @tc.desc     ArkUX_Stage_Swiper_showBackground_static_0500
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_showBackground_static_0500', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          // showBackground: 0
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      expect(obj.getElement('$attrs').getString('showBackground')).assertEqual("false")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_showBackground_static_600
     * @tc.name     ArkUX_Stage_Swiper_showBackground_static_600
     * @tc.desc     ArkUX_Stage_Swiper_showBackground_static_600
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_showBackground_static_600', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          showBackground: false
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      expect(obj.getElement('$attrs').getString('showBackground')).assertEqual("false")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_showBackground_static_0700
     * @tc.name     ArkUX_Stage_Swiper_showBackground_static_0700
     * @tc.desc     ArkUX_Stage_Swiper_showBackground_static_0700
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_showBackground_static_0700', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          // showBackground: ""
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      expect(obj.getElement('$attrs').getString('showBackground')).assertEqual("false")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_showBackground_static_0800
     * @tc.name     ArkUX_Stage_Swiper_showBackground_static_0800
     * @tc.desc     ArkUX_Stage_Swiper_showBackground_static_0800
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_showBackground_static_0800', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          showBackground: undefined
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      expect(obj.getElement('$attrs').getString('showBackground')).assertEqual("false")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_showBackground_static_0900
     * @tc.name     ArkUX_Stage_Swiper_showBackground_static_0900
     * @tc.desc     ArkUX_Stage_Swiper_showBackground_static_0900
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_showBackground_static_0900', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          // showBackground: null
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      expect(obj.getElement('$attrs').getString('showBackground')).assertEqual("false")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_IsSidebarMiddle_static_0100
     * @tc.name     ArkUX_Stage_Swiper_IsSidebarMiddle_static_0100
     * @tc.desc     ArkUX_Stage_Swiper_IsSidebarMiddle_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_IsSidebarMiddle_static_0100', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          isSidebarMiddle: true
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      expect(obj.getElement('$attrs').getString('isSidebarMiddle')).assertEqual("true")
    })

    
    /**
     * @tc.number   ArkUX_Stage_Swiper_IsSidebarMiddle_static_0200
     * @tc.name     ArkUX_Stage_Swiper_IsSidebarMiddle_static_0200
     * @tc.desc     ArkUX_Stage_Swiper_IsSidebarMiddle_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_IsSidebarMiddle_static_0200', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          // isSidebarMiddle: 1
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      expect(obj.getElement('$attrs').getString('isSidebarMiddle')).assertEqual("false")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_IsSidebarMiddle_static_0300
     * @tc.name     ArkUX_Stage_Swiper_IsSidebarMiddle_static_0300
     * @tc.desc     ArkUX_Stage_Swiper_IsSidebarMiddle_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_IsSidebarMiddle_static_0300', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          // isSidebarMiddle: "true"
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      expect(obj.getElement('$attrs').getString('isSidebarMiddle')).assertEqual("false")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_IsSidebarMiddle_static_0400
     * @tc.name     ArkUX_Stage_Swiper_IsSidebarMiddle_static_0400
     * @tc.desc     ArkUX_Stage_Swiper_IsSidebarMiddle_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_IsSidebarMiddle_static_0400', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          // isSidebarMiddle: "false",
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      expect(obj.getElement('$attrs').getString('isSidebarMiddle')).assertEqual("false")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_IsSidebarMiddle_static_0500
     * @tc.name     ArkUX_Stage_Swiper_IsSidebarMiddle_static_0500
     * @tc.desc     ArkUX_Stage_Swiper_IsSidebarMiddle_static_0500
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_IsSidebarMiddle_static_0500', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          // isSidebarMiddle: 0
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      expect(obj.getElement('$attrs').getString('isSidebarMiddle')).assertEqual("false")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_IsSidebarMiddle_static_0600
     * @tc.name     ArkUX_Stage_Swiper_IsSidebarMiddle_static_0600
     * @tc.desc     ArkUX_Stage_Swiper_IsSidebarMiddle_static_0600
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_IsSidebarMiddle_static_0600', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          isSidebarMiddle: false
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      expect(obj.getElement('$attrs').getString('isSidebarMiddle')).assertEqual("false")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_IsSidebarMiddle_static_0700
     * @tc.name     ArkUX_Stage_Swiper_IsSidebarMiddle_static_0700
     * @tc.desc     ArkUX_Stage_Swiper_IsSidebarMiddle_static_0700
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_IsSidebarMiddle_static_0700', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          // isSidebarMiddle: ""
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      expect(obj.getElement('$attrs').getString('isSidebarMiddle')).assertEqual("false")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_IsSidebarMiddle_static_0800
     * @tc.name     ArkUX_Stage_Swiper_IsSidebarMiddle_static_0800
     * @tc.desc     ArkUX_Stage_Swiper_IsSidebarMiddle_static_0800
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_IsSidebarMiddle_static_0800', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          isSidebarMiddle: undefined
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      expect(obj.getElement('$attrs').getString('isSidebarMiddle')).assertEqual("false")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_IsSidebarMiddle_static_0900
     * @tc.name     ArkUX_Stage_Swiper_IsSidebarMiddle_static_0900
     * @tc.desc     ArkUX_Stage_Swiper_IsSidebarMiddle_static_0900
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_IsSidebarMiddle_static_0900', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          // isSidebarMiddle: null
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      expect(obj.getElement('$attrs').getString('isSidebarMiddle')).assertEqual("false")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_BackgroundSize_static_0100
     * @tc.name     ArkUX_Stage_Swiper_BackgroundSize_static_0100
     * @tc.desc     ArkUX_Stage_Swiper_BackgroundSize_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_BackgroundSize_static_0100', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          showBackground: true,
          backgroundSize: 34
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_BackgroundSize_static_0100 BackgroundSize :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowBackgroundSize')));
      let backgroundSize = obj.getElement('$attrs').getString('arrowBackgroundSize');
      expect(Number.parseFloat(backgroundSize)).assertEqual(34)
      expect(backgroundSize.substr(backgroundSize.length - 2, 2)).assertEqual("vp")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_BackgroundSize_static_0200
     * @tc.name     ArkUX_Stage_Swiper_BackgroundSize_static_0200
     * @tc.desc     ArkUX_Stage_Swiper_BackgroundSize_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_BackgroundSize_static_0200', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          showBackground: true,
          backgroundSize: "20px"
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_BackgroundSize_static_0200 BackgroundSize :'
        + JSON.stringify(obj.getElement('$attrs').getString('arrowBackgroundSize')));
      let backgroundSize = obj.getElement('$attrs').getString('arrowBackgroundSize');
      expect(Number.parseFloat(backgroundSize)).assertEqual(20)
      expect(backgroundSize.substr(backgroundSize.length - 2, 2)).assertEqual("px")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_BackgroundSize_static_0300
     * @tc.name     ArkUX_Stage_Swiper_BackgroundSize_static_0300
     * @tc.desc     ArkUX_Stage_Swiper_BackgroundSize_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_BackgroundSize_static_0300', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          showBackground: true,
          isSidebarMiddle: true,
          backgroundSize: "48%"
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_BackgroundSize_static_0300 BackgroundSize :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowBackgroundSize')));
      let backgroundSize = obj.getElement('$attrs').getString('arrowBackgroundSize');
      expect(Number.parseFloat(backgroundSize)).assertEqual(32)
      expect(backgroundSize.substr(backgroundSize.length - 2, 2)).assertEqual("vp")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_BackgroundSize_static_0400
     * @tc.name     ArkUX_Stage_Swiper_BackgroundSize_static_0400
     * @tc.desc     ArkUX_Stage_Swiper_BackgroundSize_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_BackgroundSize_static_0400', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          showBackground: true,
          backgroundSize: ""
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_BackgroundSize_static_0400 BackgroundSize :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowBackgroundSize')));
      let backgroundSize = obj.getElement('$attrs').getString('arrowBackgroundSize');
      expect(Number.parseFloat(backgroundSize)).assertEqual(24)
      expect(backgroundSize.substr(backgroundSize.length - 2, 2)).assertEqual("vp")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_BackgroundSize_static_0500
     * @tc.name     ArkUX_Stage_Swiper_BackgroundSize_static_0500
     * @tc.desc     ArkUX_Stage_Swiper_BackgroundSize_static_0500
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_BackgroundSize_static_0500', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          isSidebarMiddle: true,
          backgroundSize: "-2",
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_BackgroundSize_static_0500 BackgroundSize :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowBackgroundSize')));
      let backgroundSize = obj.getElement('$attrs').getString('arrowBackgroundSize');
      expect(Number.parseFloat(backgroundSize)).assertEqual(24)
      expect(backgroundSize.substr(backgroundSize.length - 2, 2)).assertEqual("vp")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_BackgroundSize_static_0600
     * @tc.name     ArkUX_Stage_Swiper_BackgroundSize_static_0600
     * @tc.desc     ArkUX_Stage_Swiper_BackgroundSize_static_0600
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_BackgroundSize_static_0600', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          isSidebarMiddle: false,
          backgroundSize: "-2",
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_BackgroundSize_static_0600 BackgroundSize :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowBackgroundSize')));
      let backgroundSize = obj.getElement('$attrs').getString('arrowBackgroundSize');
      expect(Number.parseFloat(backgroundSize)).assertEqual(18)
      expect(backgroundSize.substr(backgroundSize.length - 2, 2)).assertEqual("vp")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_BackgroundSize_static_0700
     * @tc.name     ArkUX_Stage_Swiper_BackgroundSize_static_0700
     * @tc.desc     ArkUX_Stage_Swiper_BackgroundSize_static_0700
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_BackgroundSize_static_0700', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          showBackground: true,
          backgroundSize: "abc"
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_BackgroundSize_static_0700 BackgroundSize :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowBackgroundSize')));
      let backgroundSize = obj.getElement('$attrs').getString('arrowBackgroundSize');
      expect(Number.parseFloat(backgroundSize)).assertEqual(24)
      expect(backgroundSize.substr(backgroundSize.length - 2, 2)).assertEqual("vp")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_BackgroundSize_static_0800
     * @tc.name     ArkUX_Stage_Swiper_BackgroundSize_static_0800
     * @tc.desc     ArkUX_Stage_Swiper_BackgroundSize_static_0800
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_BackgroundSize_static_0800', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          showBackground: true,
          backgroundSize: "1000%"
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_BackgroundSize_static_0800 BackgroundSize :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowBackgroundSize')));
      let backgroundSize = obj.getElement('$attrs').getString('arrowBackgroundSize');
      expect(Number.parseFloat(backgroundSize)).assertEqual(24)
      expect(backgroundSize.substr(backgroundSize.length - 2, 2)).assertEqual("vp")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_BackgroundSize_static_0900
     * @tc.name     ArkUX_Stage_Swiper_BackgroundSize_static_0900
     * @tc.desc     ArkUX_Stage_Swiper_BackgroundSize_static_0900
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_BackgroundSize_static_0900', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          showBackground: true,
          backgroundSize: "100fp"
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_BackgroundSize_static_0900 BackgroundSize :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowBackgroundSize')));
      let backgroundSize = obj.getElement('$attrs').getString('arrowBackgroundSize');
      expect(Number.parseFloat(backgroundSize)).assertEqual(100)
      expect(backgroundSize.substr(backgroundSize.length - 2, 2)).assertEqual("fp")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_BackgroundSize_static_1000
     * @tc.name     ArkUX_Stage_Swiper_BackgroundSize_static_1000
     * @tc.desc     ArkUX_Stage_Swiper_BackgroundSize_static_1000
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_BackgroundSize_static_1000', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          showBackground: true,
          backgroundSize: 10
        } as ArrowStyle
      )
      await setArrowStyle(
        {
          showBackground: true,
          backgroundSize: "42lpx"
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_BackgroundSize_static_0000 BackgroundSize :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowBackgroundSize')));
      let backgroundSize = obj.getElement('$attrs').getString('arrowBackgroundSize');
      expect(Number.parseFloat(backgroundSize)).assertEqual(42)
      expect(backgroundSize.substr(backgroundSize.length - 3, 3)).assertEqual("lpx")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_BackgroundSize_static_1100
     * @tc.name     ArkUX_Stage_Swiper_BackgroundSize_static_1100
     * @tc.desc     ArkUX_Stage_Swiper_BackgroundSize_static_1100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_BackgroundSize_static_1100', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          showBackground: true,
          backgroundSize: 10
        } as ArrowStyle
      )
      await setArrowStyle(
        {
          showBackground: true,
          backgroundSize: "abc"
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_BackgroundSize_static_0100 BackgroundSize :'
        + JSON.stringify(obj.getElement('$attrs').getString('arrowBackgroundSize')));
      let backgroundSize = obj.getElement('$attrs').getString('arrowBackgroundSize');
      expect(Number.parseFloat(backgroundSize)).assertEqual(24)
      expect(backgroundSize.substr(backgroundSize.length - 2, 2)).assertEqual("vp")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_BackgroundSize_static_1200
     * @tc.name     ArkUX_Stage_Swiper_BackgroundSize_static_1200
     * @tc.desc     ArkUX_Stage_Swiper_BackgroundSize_static_1200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_BackgroundSize_static_1200', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          showBackground: true,
          backgroundSize: "abc"
        } as ArrowStyle
      )
      await setArrowStyle(
        {
          showBackground: true,
          backgroundSize: 10
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_BackgroundSize_static_0200 BackgroundSize :'
        + JSON.stringify(obj.getElement('$attrs').getString('arrowBackgroundSize')));
      let backgroundSize = obj.getElement('$attrs').getString('arrowBackgroundSize');
      expect(Number.parseFloat(backgroundSize)).assertEqual(10)
      expect(backgroundSize.substr(backgroundSize.length - 2, 2)).assertEqual("vp")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_BackgroundColor_static_0100
     * @tc.name     ArkUX_Stage_Swiper_BackgroundColor_static_0100
     * @tc.desc     ArkUX_Stage_Swiper_BackgroundColor_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_BackgroundColor_static_0100', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          backgroundColor: 0x00ff00
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_BackgroundColor_static_0100 BackgroundColor :'
        + JSON.stringify(obj.getElement('$attrs').getString('arrowBackgroundColor')));
      expect(obj.getElement('$attrs').getString('arrowBackgroundColor')).assertEqual("#FF00FF00")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_BackgroundColor_static_0200
     * @tc.name     ArkUX_Stage_Swiper_BackgroundColor_static_0200
     * @tc.desc     ArkUX_Stage_Swiper_BackgroundColor_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_BackgroundColor_static_0200', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          backgroundColor: "#FFFF0000"
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_BackgroundColor_static_0200 BackgroundColor :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowBackgroundColor')));
      expect(obj.getElement('$attrs').getString('arrowBackgroundColor')).assertEqual("#FFFF0000")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_BackgroundColor_static_0300
     * @tc.name     ArkUX_Stage_Swiper_BackgroundColor_static_0300
     * @tc.desc     ArkUX_Stage_Swiper_BackgroundColor_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_BackgroundColor_static_0300', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          backgroundColor: "rgb(138,43,226)"
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_BackgroundColor_static_0300 BackgroundColor :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowBackgroundColor')));
      expect(obj.getElement('$attrs').getString('arrowBackgroundColor')).assertEqual("#FF8A2BE2")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_BackgroundColor_static_0400
     * @tc.name     ArkUX_Stage_Swiper_BackgroundColor_static_0400
     * @tc.desc     ArkUX_Stage_Swiper_BackgroundColor_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_BackgroundColor_static_0400', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          backgroundColor: Color.Pink
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_BackgroundColor_static_0400 BackgroundColor :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowBackgroundColor')));
      expect(obj.getElement('$attrs').getString('arrowBackgroundColor')).assertEqual("#FFFFC0CB")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_BackgroundColor_static_0500
     * @tc.name     ArkUX_Stage_Swiper_BackgroundColor_static_0500
     * @tc.desc     ArkUX_Stage_Swiper_BackgroundColor_static_0500
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_BackgroundColor_static_0500', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          isSidebarMiddle: true,
          backgroundColor: ""
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_BackgroundColor_static_0500 BackgroundColor :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowBackgroundColor')));
      expect(obj.getElement('$attrs').getString('arrowBackgroundColor'))
        .assertEqual(obj.getElement('$attrs').getString('backgroundColor'))
    })

    
    /**
     * @tc.number   ArkUX_Stage_Swiper_BackgroundColor_static_0600
     * @tc.name     ArkUX_Stage_Swiper_BackgroundColor_static_0600
     * @tc.desc     ArkUX_Stage_Swiper_BackgroundColor_static_0600
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_BackgroundColor_static_0600', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          isSidebarMiddle: false,
          backgroundColor: ""
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_BackgroundColor_static_0600 BackgroundColor :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowBackgroundColor')));
      expect(obj.getElement('$attrs').getString('arrowBackgroundColor')).assertEqual("#00000000")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_BackgroundColor_static_0700
     * @tc.name     ArkUX_Stage_Swiper_BackgroundColor_static_0700
     * @tc.desc     ArkUX_Stage_Swiper_BackgroundColor_static_0700
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_BackgroundColor_static_0700', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          isSidebarMiddle: true,
          // backgroundColor: null
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_BackgroundColor_static_0700 BackgroundColor :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowBackgroundColor')));
      expect(obj.getElement('$attrs').getString('arrowBackgroundColor'))
        .assertEqual(obj.getElement('$attrs').getString('backgroundColor'))
    })

    
    /**
     * @tc.number   ArkUX_Stage_Swiper_BackgroundColor_static_0800
     * @tc.name     ArkUX_Stage_Swiper_BackgroundColor_static_0800
     * @tc.desc     ArkUX_Stage_Swiper_BackgroundColor_static_0800
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_BackgroundColor_static_0800', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          isSidebarMiddle: false,
          // backgroundColor: null
        }  as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_BackgroundColor_static_0800 BackgroundColor :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowBackgroundColor')));
      expect(obj.getElement('$attrs').getString('arrowBackgroundColor')).assertEqual("#00000000")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_BackgroundColor_static_0900
     * @tc.name     ArkUX_Stage_Swiper_BackgroundColor_static_0900
     * @tc.desc     ArkUX_Stage_Swiper_BackgroundColor_static_0900
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_BackgroundColor_static_0900', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          backgroundColor: $r("app.color.swiper_BackgroundColor_test")
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_BackgroundColor_static_0900 BackgroundColor :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowBackgroundColor')));
      expect(obj.getElement('$attrs').getString('arrowBackgroundColor')).assertEqual("#FFFF0000")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_BackgroundColor_static_1000
     * @tc.name     ArkUX_Stage_Swiper_BackgroundColor_static_1000
     * @tc.desc     ArkUX_Stage_Swiper_BackgroundColor_static_1000
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_BackgroundColor_static_1000', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          isSidebarMiddle: true,
          backgroundColor: "bgr(138,43,226)"
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_BackgroundColor_static_1000 BackgroundColor :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowBackgroundColor')));
      expect(obj.getElement('$attrs').getString('arrowBackgroundColor'))
        .assertEqual(obj.getElement('$attrs').getString('backgroundColor'))
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_BackgroundColor_static_1100
     * @tc.name     ArkUX_Stage_Swiper_BackgroundColor_static_1100
     * @tc.desc     ArkUX_Stage_Swiper_BackgroundColor_static_1100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_BackgroundColor_static_1100', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          isSidebarMiddle: false,
          backgroundColor: "bgr(138,43,226)"
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_BackgroundColor_static_1100 BackgroundColor :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowBackgroundColor')));
      expect(obj.getElement('$attrs').getString('arrowBackgroundColor')).assertEqual("#00000000")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_BackgroundColor_static_1200
     * @tc.name     ArkUX_Stage_Swiper_BackgroundColor_static_1200
     * @tc.desc     ArkUX_Stage_Swiper_BackgroundColor_static_1200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_BackgroundColor_static_1200', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          isSidebarMiddle: true,
          backgroundColor: undefined
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_BackgroundColor_static_1200 BackgroundColor :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowBackgroundColor')));
      expect(obj.getElement('$attrs').getString('arrowBackgroundColor'))
        .assertEqual(obj.getElement('$attrs').getString('backgroundColor'))
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_BackgroundColor_static_1300
     * @tc.name     ArkUX_Stage_Swiper_BackgroundColor_static_1300
     * @tc.desc     ArkUX_Stage_Swiper_BackgroundColor_static_1300
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_BackgroundColor_static_1300', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          isSidebarMiddle: false,
          backgroundColor: undefined
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_BackgroundColor_static_1300 BackgroundColor :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowBackgroundColor')));
      expect(obj.getElement('$attrs').getString('arrowBackgroundColor')).assertEqual("#00000000")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_BackgroundColor_static_1400
     * @tc.name     ArkUX_Stage_Swiper_BackgroundColor_static_1400
     * @tc.desc     ArkUX_Stage_Swiper_BackgroundColor_static_1400
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_BackgroundColor_static_1400', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          backgroundColor: "rgb(138,43,226)"
        } as ArrowStyle
      )
      await setArrowStyle(
        {
          backgroundColor: Color.Gray
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_BackgroundColor_static_1400 BackgroundColor :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowBackgroundColor')));
      expect(obj.getElement('$attrs').getString('arrowBackgroundColor')).assertEqual("#FF808080")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_BackgroundColor_static_1500
     * @tc.name     ArkUX_Stage_Swiper_BackgroundColor_static_1500
     * @tc.desc     ArkUX_Stage_Swiper_BackgroundColor_static_1500
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_BackgroundColor_static_1500', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          backgroundColor: "rgb(255,0,0)"
        } as ArrowStyle
      )
      await setArrowStyle(
        {
          isSidebarMiddle: true,
          backgroundColor: undefined
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_BackgroundColor_static_1500 BackgroundColor :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowBackgroundColor')));
      expect(obj.getElement('$attrs').getString('arrowBackgroundColor'))
        .assertEqual(obj.getElement('$attrs').getString('backgroundColor'))
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_BackgroundColor_static_1600
     * @tc.name     ArkUX_Stage_Swiper_BackgroundColor_static_1600
     * @tc.desc     ArkUX_Stage_Swiper_BackgroundColor_static_1600
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_BackgroundColor_static_1600', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          backgroundColor: undefined,
        } as ArrowStyle
      )
      await setArrowStyle(
        {
          backgroundColor: "rgb(255,0,0)",
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_BackgroundColor_static_1600 BackgroundColor :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowBackgroundColor')));
      expect(obj.getElement('$attrs').getString('arrowBackgroundColor')).assertEqual("#FFFF0000")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_ArrowSize_static_0100
     * @tc.name     ArkUX_Stage_Swiper_ArrowSize_static_0100
     * @tc.desc     ArkUX_Stage_Swiper_ArrowSize_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_ArrowSize_static_0100', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          showBackground: false,
          backgroundSize: 12,
          arrowSize: 34
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_ArrowSize_static_0100 arrowSize :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowSize')));
      let arrowSize = obj.getElement('$attrs').getString('arrowSize');
      expect(Number.parseFloat(arrowSize)).assertEqual(34)
      expect(arrowSize.substr(arrowSize.length - 2, 2)).assertEqual("vp")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_ArrowSize_static_0200
     * @tc.name     ArkUX_Stage_Swiper_ArrowSize_static_0200
     * @tc.desc     ArkUX_Stage_Swiper_ArrowSize_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_ArrowSize_static_0200', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          showBackground: true,
          backgroundSize: 12,
          arrowSize: 34
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_ArrowSize_static_0200 arrowSize :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowSize')));
      let arrowSize = obj.getElement('$attrs').getString('arrowSize');
      expect(Number.parseFloat(arrowSize)).assertEqual(9)
      expect(arrowSize.substr(arrowSize.length - 2, 2)).assertEqual("vp")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_ArrowSize_static_0300
     * @tc.name     ArkUX_Stage_Swiper_ArrowSize_static_0300
     * @tc.desc     ArkUX_Stage_Swiper_ArrowSize_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_ArrowSize_static_0300', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          showBackground: false,
          isSidebarMiddle: false,
          arrowSize: "20px"
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_ArrowSize_static_0300 arrowSize :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowSize')));
      let arrowSize = obj.getElement('$attrs').getString('arrowSize');
      expect(Number.parseFloat(arrowSize)).assertEqual(20)
      expect(arrowSize.substr(arrowSize.length - 2, 2)).assertEqual("px")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_ArrowSize_static_0400
     * @tc.name     ArkUX_Stage_Swiper_ArrowSize_static_0400
     * @tc.desc     ArkUX_Stage_Swiper_ArrowSize_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_ArrowSize_static_0400', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          showBackground: true,
          isSidebarMiddle: true,
          arrowSize: "20px"
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_ArrowSize_static_0400 arrowSize :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowSize')));
      let arrowSize = obj.getElement('$attrs').getString('arrowSize');
      expect(Number.parseFloat(arrowSize)).assertEqual(24)
      expect(arrowSize.substr(arrowSize.length - 2, 2)).assertEqual("vp")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_ArrowSize_static_0500
     * @tc.name     ArkUX_Stage_Swiper_ArrowSize_static_0500
     * @tc.desc     ArkUX_Stage_Swiper_ArrowSize_static_0500
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_ArrowSize_static_0500', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          showBackground: true,
          isSidebarMiddle: false,
          arrowSize: "20px"
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_ArrowSize_static_0500 arrowSize :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowSize')));
      let arrowSize = obj.getElement('$attrs').getString('arrowSize');
      expect(Number.parseFloat(arrowSize)).assertEqual(18)
      expect(arrowSize.substr(arrowSize.length - 2, 2)).assertEqual("vp")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_ArrowSize_static_0600
     * @tc.name     ArkUX_Stage_Swiper_ArrowSize_static_0600
     * @tc.desc     ArkUX_Stage_Swiper_ArrowSize_static_0600
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_ArrowSize_static_0600', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          arrowSize: "48%"
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_ArrowSize_static_0600 arrowSize :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowSize')));
      let arrowSize = obj.getElement('$attrs').getString('arrowSize');
      expect(Number.parseFloat(arrowSize)).assertEqual(18)
      expect(arrowSize.substr(arrowSize.length - 2, 2)).assertEqual("vp")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_ArrowSize_static_0700
     * @tc.name     ArkUX_Stage_Swiper_ArrowSize_static_0700
     * @tc.desc     ArkUX_Stage_Swiper_ArrowSize_static_0700
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_ArrowSize_static_0700', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          arrowSize: ""
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_ArrowSize_static_0700 arrowSize :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowSize')));
      let arrowSize = obj.getElement('$attrs').getString('arrowSize');
      expect(Number.parseFloat(arrowSize)).assertEqual(18)
      expect(arrowSize.substr(arrowSize.length - 2, 2)).assertEqual("vp")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_ArrowSize_static_0800
     * @tc.name     ArkUX_Stage_Swiper_ArrowSize_static_0800
     * @tc.desc     ArkUX_Stage_Swiper_ArrowSize_static_0800
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_ArrowSize_static_0800', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          isSidebarMiddle: true,
          showBackground: true,
          backgroundSize: 12,
          arrowSize: "-2"
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_ArrowSize_static_0800 arrowSize :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowSize')));
      let arrowSize = obj.getElement('$attrs').getString('arrowSize');
      expect(Number.parseFloat(arrowSize)).assertEqual(9)
      expect(arrowSize.substr(arrowSize.length - 2, 2)).assertEqual("vp")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_ArrowSize_static_0900
     * @tc.name     ArkUX_Stage_Swiper_ArrowSize_static_0900
     * @tc.desc     ArkUX_Stage_Swiper_ArrowSize_static_0900
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_ArrowSize_static_0900', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          isSidebarMiddle: true,
          showBackground: false,
          backgroundSize: 12,
          arrowSize: "-2"
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_ArrowSize_static_0900 arrowSize :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowSize')));
      let arrowSize = obj.getElement('$attrs').getString('arrowSize');
      expect(Number.parseFloat(arrowSize)).assertEqual(24)
      expect(arrowSize.substr(arrowSize.length - 2, 2)).assertEqual("vp")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_ArrowSize_static_1000
     * @tc.name     ArkUX_Stage_Swiper_ArrowSize_static_1000
     * @tc.desc     ArkUX_Stage_Swiper_ArrowSize_static_1000
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_ArrowSize_static_1000', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          showBackground: false,
          isSidebarMiddle: false,
          backgroundSize: 12,
          arrowSize: "-2"
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_ArrowSize_static_1000 arrowSize :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowSize')));
      let arrowSize = obj.getElement('$attrs').getString('arrowSize');
      expect(Number.parseFloat(arrowSize)).assertEqual(18)
      expect(arrowSize.substr(arrowSize.length - 2, 2)).assertEqual("vp")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_ArrowSize_static_1100
     * @tc.name     ArkUX_Stage_Swiper_ArrowSize_static_1100
     * @tc.desc     ArkUX_Stage_Swiper_ArrowSize_static_1100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_ArrowSize_static_1100', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          arrowSize: "abc"
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_ArrowSize_static_1100 arrowSize :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowSize')));
      let arrowSize = obj.getElement('$attrs').getString('arrowSize');
      expect(Number.parseFloat(arrowSize)).assertEqual(18)
      expect(arrowSize.substr(arrowSize.length - 2, 2)).assertEqual("vp")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_ArrowSize_static_1200
     * @tc.name     ArkUX_Stage_Swiper_ArrowSize_static_1200
     * @tc.desc     ArkUX_Stage_Swiper_ArrowSize_static_1200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_ArrowSize_static_1200', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          arrowSize: "1000%"
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_ArrowSize_static_1200 arrowSize :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowSize')));
      let arrowSize = obj.getElement('$attrs').getString('arrowSize');
      expect(Number.parseFloat(arrowSize)).assertEqual(18)
      expect(arrowSize.substr(arrowSize.length - 2, 2)).assertEqual("vp")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_ArrowSize_static_1300
     * @tc.name     ArkUX_Stage_Swiper_ArrowSize_static_1300
     * @tc.desc     ArkUX_Stage_Swiper_ArrowSize_static_1300
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_ArrowSize_static_1300', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          arrowSize: "100fp"
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_ArrowSize_static_1300 arrowSize :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowSize')));
      let arrowSize = obj.getElement('$attrs').getString('arrowSize');
      expect(Number.parseFloat(arrowSize)).assertEqual(100)
      expect(arrowSize.substr(arrowSize.length - 2, 2)).assertEqual("fp")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_ArrowSize_static_1400
     * @tc.name     ArkUX_Stage_Swiper_ArrowSize_static_1400
     * @tc.desc     ArkUX_Stage_Swiper_ArrowSize_static_1400
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_ArrowSize_static_1400', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          arrowSize: 10
        } as ArrowStyle
      )
      await setArrowStyle(
        {
          arrowSize: "42lpx"
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_ArrowSize_static_1400 arrowSize :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowSize')));
      let arrowSize = obj.getElement('$attrs').getString('arrowSize');
      expect(Number.parseFloat(arrowSize)).assertEqual(42)
      expect(arrowSize.substr(arrowSize.length - 3, 3)).assertEqual("lpx")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_ArrowSize_static_1500
     * @tc.name     ArkUX_Stage_Swiper_ArrowSize_static_1500
     * @tc.desc     ArkUX_Stage_Swiper_ArrowSize_static_1500
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_ArrowSize_static_1500', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          arrowSize: 10
        } as ArrowStyle
      )
      await setArrowStyle(
        {
          arrowSize: "abc"
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_ArrowSize_static_1500 arrowSize :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowSize')));
      let arrowSize = obj.getElement('$attrs').getString('arrowSize');
      expect(Number.parseFloat(arrowSize)).assertEqual(18)
      expect(arrowSize.substr(arrowSize.length - 2, 2)).assertEqual("vp")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_ArrowSize_static_1600
     * @tc.name     ArkUX_Stage_Swiper_ArrowSize_static_1600
     * @tc.desc     ArkUX_Stage_Swiper_ArrowSize_static_1600
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_ArrowSize_static_1600', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          arrowSize: "abc"
        } as ArrowStyle
      )
      await setArrowStyle(
        {
          arrowSize: 10
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_ArrowSize_static_1600 arrowSize :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowSize')));
      let arrowSize = obj.getElement('$attrs').getString('arrowSize');
      expect(Number.parseFloat(arrowSize)).assertEqual(10)
      expect(arrowSize.substr(arrowSize.length - 2, 2)).assertEqual("vp")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_ArrowColor_static_0100
     * @tc.name     ArkUX_Stage_Swiper_ArrowColor_static_0100
     * @tc.desc     ArkUX_Stage_Swiper_ArrowColor_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_ArrowColor_static_0100', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          arrowColor: 0x00ff00
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_ArrowColor_static_0100 arrowColor :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowColor')));
      expect(obj.getElement('$attrs').getString('arrowColor')).assertEqual("#FF00FF00")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_ArrowColor_static_0200
     * @tc.name     ArkUX_Stage_Swiper_ArrowColor_static_0200
     * @tc.desc     ArkUX_Stage_Swiper_ArrowColor_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_ArrowColor_static_0200', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          arrowColor: "#FFFF0000"
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_ArrowColor_static_0200 arrowColor :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowColor')));
      expect(obj.getElement('$attrs').getString('arrowColor')).assertEqual("#FFFF0000")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_ArrowColor_static_0300
     * @tc.name     ArkUX_Stage_Swiper_ArrowColor_static_0300
     * @tc.desc     ArkUX_Stage_Swiper_ArrowColor_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_ArrowColor_static_0300', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          arrowColor: "rgb(138,43,226)"
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_ArrowColor_static_0300 arrowColor :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowColor')));
      expect(obj.getElement('$attrs').getString('arrowColor')).assertEqual("#FF8A2BE2")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_ArrowColor_static_0400
     * @tc.name     ArkUX_Stage_Swiper_ArrowColor_static_0400
     * @tc.desc     ArkUX_Stage_Swiper_ArrowColor_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_ArrowColor_static_0400', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          arrowColor: Color.Pink
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_ArrowColor_static_0400 arrowColor :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowColor')));
      expect(obj.getElement('$attrs').getString('arrowColor')).assertEqual("#FFFFC0CB")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_ArrowColor_static_0500
     * @tc.name     ArkUX_Stage_Swiper_ArrowColor_static_0500
     * @tc.desc     ArkUX_Stage_Swiper_ArrowColor_static_0500
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_ArrowColor_static_0500', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          arrowColor: ""
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_ArrowColor_static_0500 arrowColor :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowColor')));
      expect(obj.getElement('$attrs').getString('arrowColor'))
        .assertEqual(obj.getElement('$attrs').getString('foregroundColor'))
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_ArrowColor_static_0600
     * @tc.name     ArkUX_Stage_Swiper_ArrowColor_static_0600
     * @tc.desc     ArkUX_Stage_Swiper_ArrowColor_static_0600
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_ArrowColor_static_0600', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          // arrowColor: null
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_ArrowColor_static_0600 arrowColor :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowColor')));
      expect(obj.getElement('$attrs').getString('arrowColor'))
        .assertEqual(obj.getElement('$attrs').getString('foregroundColor'))
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_ArrowColor_static_0700
     * @tc.name     ArkUX_Stage_Swiper_ArrowColor_static_0700
     * @tc.desc     ArkUX_Stage_Swiper_ArrowColor_static_0700
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_ArrowColor_static_0700', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          arrowColor: $r("app.color.swiper_BackgroundColor_test")
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_ArrowColor_static_0700 arrowColor :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowColor')));
      expect(obj.getElement('$attrs').getString('arrowColor')).assertEqual("#FFFF0000")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_ArrowColor_static_0800
     * @tc.name     ArkUX_Stage_Swiper_ArrowColor_static_0800
     * @tc.desc     ArkUX_Stage_Swiper_ArrowColor_static_0800
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_ArrowColor_static_0800', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          arrowColor: "bgr(138,43,226)"
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_ArrowColor_static_0800 arrowColor :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowColor')));
      expect(obj.getElement('$attrs').getString('arrowColor'))
        .assertEqual(obj.getElement('$attrs').getString('foregroundColor'))
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_ArrowColor_static_0900
     * @tc.name     ArkUX_Stage_Swiper_ArrowColor_static_0900
     * @tc.desc     ArkUX_Stage_Swiper_ArrowColor_static_0900
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_ArrowColor_static_0900', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          arrowColor: undefined
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_ArrowColor_static_0900 arrowColor :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowColor')));
      expect(obj.getElement('$attrs').getString('arrowColor'))
        .assertEqual(obj.getElement('$attrs').getString('foregroundColor'))
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_ArrowColor_static_1000
     * @tc.name     ArkUX_Stage_Swiper_ArrowColor_static_1000
     * @tc.desc     ArkUX_Stage_Swiper_ArrowColor_static_1000
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_ArrowColor_static_1000', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          arrowColor: "rgb(138,43,226)"
        } as ArrowStyle
      )
      await setArrowStyle(
        {
          arrowColor: Color.Gray
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_ArrowColor_static_1000 arrowColor :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowColor')));
      expect(obj.getElement('$attrs').getString('arrowColor')).assertEqual("#FF808080")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_ArrowColor_static_1100
     * @tc.name     ArkUX_Stage_Swiper_ArrowColor_static_1100
     * @tc.desc     ArkUX_Stage_Swiper_ArrowColor_static_1100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_ArrowColor_static_1100', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          // BackgroundColor: "rgb(255,0,0)",
        } as ArrowStyle
      )
      await setArrowStyle(
        {
          // BackgroundColor: undefined
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_ArrowColor_static_1100 arrowColor :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowColor')));
      expect(obj.getElement('$attrs').getString('arrowColor'))
        .assertEqual(obj.getElement('$attrs').getString('foregroundColor'))
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_ArrowColor_static_1200
     * @tc.name     ArkUX_Stage_Swiper_ArrowColor_static_1200
     * @tc.desc     ArkUX_Stage_Swiper_ArrowColor_static_1200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_ArrowColor_static_1200', Level.LEVEL0, async (): Promise<void> => {
      await setArrowStyle(
        {
          arrowColor: undefined
        } as ArrowStyle
      )
      await setArrowStyle(
        {
          arrowColor: "#FFFF0000"
        } as ArrowStyle
      )
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_ArrowColor_static_1200 arrowColor :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowColor')));
      expect(obj.getElement('$attrs').getString('arrowColor')).assertEqual("#FFFF0000")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_IsArrow_static_0100
     * @tc.name     ArkUX_Stage_Swiper_IsArrow_static_0100
     * @tc.desc     ArkUX_Stage_Swiper_IsArrow_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_IsArrow_static_0100', Level.LEVEL0, async (): Promise<void> => {
      await setBoolean("BoolTrue", true)
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperB"))
      console.info('ArkUX_Stage_Swiper_IsArrow_static_0100 displayArrow :' +
      JSON.stringify(obj.getElement('$attrs').getString('displayArrow')));
      expect(obj.getElement('$attrs').getString('displayArrow')).assertEqual("true")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_IsArrow_static_0200
     * @tc.name     ArkUX_Stage_Swiper_IsArrow_static_0200
     * @tc.desc     ArkUX_Stage_Swiper_IsArrow_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_IsArrow_static_0200', Level.LEVEL0, async (): Promise<void> => {
      await setBoolean("BoolFalse", false)
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperB"))
      console.info('ArkUX_Stage_Swiper_IsArrow_static_0200 displayArrow :' +
      JSON.stringify(obj.getElement('$attrs').getString('displayArrow')));
      expect(obj.getElement('$attrs').getString('displayArrow')).assertEqual("false")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_IsArrow_static_0300
     * @tc.name     ArkUX_Stage_Swiper_IsArrow_static_0300
     * @tc.desc     ArkUX_Stage_Swiper_IsArrow_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_IsArrow_static_0300', Level.LEVEL0, async (): Promise<void> => {
      await setBoolean("BoolErrStr", "true")
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperB"))
      console.info('ArkUX_Stage_Swiper_IsArrow_static_0300 displayArrow :' +
      JSON.stringify(obj.getElement('$attrs').getString('displayArrow')));
      expect(obj.getElement('$attrs').getString('displayArrow')).assertEqual("true")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_IsArrow_static_0400
     * @tc.name     ArkUX_Stage_Swiper_IsArrow_static_0400
     * @tc.desc     ArkUX_Stage_Swiper_IsArrow_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_IsArrow_static_0400', Level.LEVEL0, async (): Promise<void> => {
      await setBoolean("BoolErrStr", "false")
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperB"))
      console.info('ArkUX_Stage_Swiper_IsArrow_static_0400 displayArrow :' +
      JSON.stringify(obj.getElement('$attrs').getString('displayArrow')));
      expect(obj.getElement('$attrs').getString('displayArrow')).assertEqual("false")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_IsArrow_static_0500
     * @tc.name     ArkUX_Stage_Swiper_IsArrow_static_0500
     * @tc.desc     ArkUX_Stage_Swiper_IsArrow_static_0500
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_IsArrow_static_0500', Level.LEVEL0, async (): Promise<void> => {
      await setBoolean("BoolErrUndefined", undefined)
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperB"))
      console.info('ArkUX_Stage_Swiper_IsArrow_static_0500 displayArrow :' +
      JSON.stringify(obj.getElement('$attrs').getString('displayArrow')));
      expect(obj.getElement('$attrs').getString('displayArrow')).assertEqual("false")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_IsArrow_static_0600
     * @tc.name     ArkUX_Stage_Swiper_IsArrow_static_0600
     * @tc.desc     ArkUX_Stage_Swiper_IsArrow_static_0600
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_IsArrow_static_0600', Level.LEVEL0, async (): Promise<void> => {
      await setBoolean("BoolErrNull", null)
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperB"))
      console.info('ArkUX_Stage_Swiper_IsArrow_static_0600 displayArrow :' +
      JSON.stringify(obj.getElement('$attrs').getString('displayArrow')));
      expect(obj.getElement('$attrs').getString('displayArrow')).assertEqual("false")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_IsArrow_static_0700
     * @tc.name     ArkUX_Stage_Swiper_IsArrow_static_0700
     * @tc.desc     ArkUX_Stage_Swiper_IsArrow_static_0700
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_IsArrow_static_0700', Level.LEVEL0, async (): Promise<void> => {
      await setBoolean("BoolErrStr", "")
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperB"))
      console.info('ArkUX_Stage_Swiper_IsArrow_static_0700 displayArrow :' +
      JSON.stringify(obj.getElement('$attrs').getString('displayArrow')));
      expect(obj.getElement('$attrs').getString('displayArrow')).assertEqual("false")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_IsArrow_static_0800
     * @tc.name     ArkUX_Stage_Swiper_IsArrow_static_0800
     * @tc.desc     ArkUX_Stage_Swiper_IsArrow_static_0800
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_IsArrow_static_0800', Level.LEVEL0, async (): Promise<void> => {
      await setBoolean("BoolErrNum", 1)
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperB"))
      console.info('ArkUX_Stage_Swiper_IsArrow_static_0800 displayArrow :' +
      JSON.stringify(obj.getElement('$attrs').getString('displayArrow')));
      expect(obj.getElement('$attrs').getString('displayArrow')).assertEqual("true")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_IsHoverShow_static_0100
     * @tc.name     ArkUX_Stage_Swiper_IsHoverShow_static_0100
     * @tc.desc     ArkUX_Stage_Swiper_IsHoverShow_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_IsHoverShow_static_0100', Level.LEVEL0, async (): Promise<void> => {
      await setBoolean("BoolTrue", true)
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperC"))
      console.info('ArkUX_Stage_Swiper_IsHoverShow_static_0100 hoverShow :' +
      JSON.stringify(obj.getElement('$attrs').getString('hoverShow')));
      expect(obj.getElement('$attrs').getString('hoverShow')).assertEqual("true")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_IsHoverShow_static_0200
     * @tc.name     ArkUX_Stage_Swiper_IsHoverShow_static_0200
     * @tc.desc     ArkUX_Stage_Swiper_IsHoverShow_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_IsHoverShow_static_0200', Level.LEVEL0, async (): Promise<void> => {
      await setBoolean("BoolFalse", false)
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperC"))
      console.info('ArkUX_Stage_Swiper_IsHoverShow_static_0200 hoverShow :' +
      JSON.stringify(obj.getElement('$attrs').getString('hoverShow')));
      expect(obj.getElement('$attrs').getString('hoverShow')).assertEqual("false")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_IsHoverShow_static_0300
     * @tc.name     ArkUX_Stage_Swiper_IsHoverShow_static_0300
     * @tc.desc     ArkUX_Stage_Swiper_IsHoverShow_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_IsHoverShow_static_0300', Level.LEVEL0, async (): Promise<void> => {
      await setBoolean("BoolErrStr", "true")
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperC"))
      console.info('ArkUX_Stage_Swiper_IsHoverShow_static_0300 hoverShow :' +
      JSON.stringify(obj.getElement('$attrs').getString('hoverShow')));
      expect(obj.getElement('$attrs').getString('hoverShow')).assertEqual("true")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_IsHoverShow_static_0400
     * @tc.name     ArkUX_Stage_Swiper_IsHoverShow_static_0400
     * @tc.desc     ArkUX_Stage_Swiper_IsHoverShow_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_IsHoverShow_static_0400', Level.LEVEL0, async (): Promise<void> => {
      await setBoolean("BoolErrStr", "false")
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperC"))
      console.info('ArkUX_Stage_Swiper_IsHoverShow_static_0400 hoverShow :' +
      JSON.stringify(obj.getElement('$attrs').getString('hoverShow')));
      expect(obj.getElement('$attrs').getString('hoverShow')).assertEqual("false")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_IsHoverShow_static_0500
     * @tc.name     ArkUX_Stage_Swiper_IsHoverShow_static_0500
     * @tc.desc     ArkUX_Stage_Swiper_IsHoverShow_static_0500
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_IsHoverShow_static_0500', Level.LEVEL0, async (): Promise<void> => {
      await setBoolean("BoolErrUndefined", undefined)
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperC"))
      console.info('ArkUX_Stage_Swiper_IsHoverShow_static_0500 hoverShow :' +
      JSON.stringify(obj.getElement('$attrs').getString('hoverShow')));
      expect(obj.getElement('$attrs').getString('hoverShow')).assertEqual("false")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_IsHoverShow_static_0600
     * @tc.name     ArkUX_Stage_Swiper_IsHoverShow_static_0600
     * @tc.desc     ArkUX_Stage_Swiper_IsHoverShow_static_0600
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_IsHoverShow_static_0600', Level.LEVEL0, async (): Promise<void> => {
      await setBoolean("BoolErrNull", null)
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperC"))
      console.info('ArkUX_Stage_Swiper_IsHoverShow_static_0600 hoverShow :' +
      JSON.stringify(obj.getElement('$attrs').getString('hoverShow')));
      expect(obj.getElement('$attrs').getString('hoverShow')).assertEqual("false")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_IsHoverShow_static_0700
     * @tc.name     ArkUX_Stage_Swiper_IsHoverShow_static_0700
     * @tc.desc     ArkUX_Stage_Swiper_IsHoverShow_static_0700
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_IsHoverShow_static_0700', Level.LEVEL0, async (): Promise<void> => {
      await setBoolean("BoolErrStr", "")
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperC"))
      console.info('ArkUX_Stage_Swiper_IsHoverShow_static_0700 hoverShow :' +
      JSON.stringify(obj.getElement('$attrs').getString('hoverShow')));
      expect(obj.getElement('$attrs').getString('hoverShow')).assertEqual("false")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_IsHoverShow_static_0800
     * @tc.name     ArkUX_Stage_Swiper_IsHoverShow_static_0800
     * @tc.desc     ArkUX_Stage_Swiper_IsHoverShow_static_0800
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_IsHoverShow_static_0800', Level.LEVEL0, async (): Promise<void> => {
      await setBoolean("BoolErrNum", 1)
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperC"))
      console.info('ArkUX_Stage_Swiper_IsHoverShow_static_0800 hoverShow :' +
      JSON.stringify(obj.getElement('$attrs').getString('hoverShow')));
      expect(obj.getElement('$attrs').getString('hoverShow')).assertEqual("true")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_NotSet_static_0100
     * @tc.name     ArkUX_Stage_Swiper_NotSet_static_0100
     * @tc.desc     ArkUX_Stage_Swiper_NotSet_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_NotSet_static_0100', Level.LEVEL0, async (): Promise<void> => {
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperD"))
      console.info('ArkUX_Stage_Swiper_NotSet_static_0100 showBackground :' +
      JSON.stringify(obj.getElement('$attrs').getElement('showBackground')));
      console.info('ArkUX_Stage_Swiper_NotSet_static_0100 isSidebarMiddle :' +
      JSON.stringify(obj.getElement('$attrs').getElement('isSidebarMiddle')));
      console.info('ArkUX_Stage_Swiper_NotSet_static_0100 backgroundSize :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowBackgroundSize')));
      console.info('ArkUX_Stage_Swiper_NotSet_static_0100 backgroundColor :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowBackgroundColor')));
      console.info('ArkUX_Stage_Swiper_NotSet_static_0100 arrowSize :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowSize')));
      console.info('ArkUX_Stage_Swiper_NotSet_static_0100 arrowColor :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowColor')));
      console.info('ArkUX_Stage_Swiper_NotSet_static_0100 displayArrow :' +
      JSON.stringify(obj.getElement('$attrs').getString('displayArrow')));
      console.info('ArkUX_Stage_Swiper_NotSet_static_0100 isHoverShow :' +
      JSON.stringify(obj.getElement('$attrs').getString('hoverShow')));
      let backgroundSize = obj.getElement('$attrs').getString('arrowBackgroundSize');
      expect(Number.parseFloat(backgroundSize)).assertEqual(18)
      expect(backgroundSize.substr(backgroundSize.length - 2, 2)).assertEqual("vp")
      let arrowSize = obj.getElement('$attrs').getString('arrowSize');
      expect(Number.parseFloat(arrowSize)).assertEqual(18)
      expect(arrowSize.substr(arrowSize.length - 2, 2)).assertEqual("vp")
      expect(obj.getElement('$attrs').getString('showBackground')).assertEqual("false")
      expect(obj.getElement('$attrs').getString('isSidebarMiddle')).assertEqual("false")
      expect(obj.getElement('$attrs').getString('arrowBackgroundColor')).assertEqual("#00000000")
      expect(obj.getElement('$attrs').getString('arrowColor'))
        .assertEqual(obj.getElement('$attrs').getString('foregroundColor'))
      expect(obj.getElement('$attrs').getString('displayArrow')).assertEqual("true")
      expect(obj.getElement('$attrs').getString('hoverShow')).assertEqual("false")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_NotSet_static_0200
     * @tc.name     ArkUX_Stage_Swiper_NotSet_static_0200
     * @tc.desc     ArkUX_Stage_Swiper_NotSet_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_NotSet_static_0200', Level.LEVEL0, async (): Promise<void> => {
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperE"))
      console.info('ArkUX_Stage_Swiper_NotSet_static_0200 showBackground :' +
      JSON.stringify(obj.getElement('$attrs').getElement('showBackground')));
      console.info('ArkUX_Stage_Swiper_NotSet_static_0200 isSidebarMiddle :' +
      JSON.stringify(obj.getElement('$attrs').getElement('isSidebarMiddle')));
      console.info('ArkUX_Stage_Swiper_NotSet_static_0200 backgroundSize :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowBackgroundSize')));
      console.info('ArkUX_Stage_Swiper_NotSet_static_0200 backgroundColor :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowBackgroundColor')));
      console.info('ArkUX_Stage_Swiper_NotSet_static_0200 arrowSize :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowSize')));
      console.info('ArkUX_Stage_Swiper_NotSet_static_0200 arrowColor :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowColor')));
      console.info('ArkUX_Stage_Swiper_NotSet_static_0200 displayArrow :' +
      JSON.stringify(obj.getElement('$attrs').getString('displayArrow')));
      console.info('ArkUX_Stage_Swiper_NotSet_static_0200 isHoverShow :' +
      JSON.stringify(obj.getElement('$attrs').getString('hoverShow')));
      let backgroundSize = obj.getElement('$attrs').getString('arrowBackgroundSize');
      expect(Number.parseFloat(backgroundSize)).assertEqual(24)
      expect(backgroundSize.substr(backgroundSize.length - 2, 2)).assertEqual("vp")
      let arrowSize = obj.getElement('$attrs').getString('arrowSize');
      expect(Number.parseFloat(arrowSize)).assertEqual(18)
      expect(arrowSize.substr(arrowSize.length - 2, 2)).assertEqual("vp")
      expect(obj.getElement('$attrs').getString('showBackground')).assertEqual("false")
      expect(obj.getElement('$attrs').getString('isSidebarMiddle')).assertEqual("false")
      expect(obj.getElement('$attrs').getString('arrowBackgroundColor')).assertEqual("#00000000")
      expect(obj.getElement('$attrs').getString('arrowColor'))
        .assertEqual(obj.getElement('$attrs').getString('foregroundColor'))
      expect(obj.getElement('$attrs').getString('displayArrow')).assertEqual("true")
      expect(obj.getElement('$attrs').getString('hoverShow')).assertEqual("false")
    })


    
    /**
     * @tc.number   ArkUX_Stage_Swiper_NotSet_static_0300
     * @tc.name     ArkUX_Stage_Swiper_NotSet_static_0300
     * @tc.desc     ArkUX_Stage_Swiper_NotSet_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_Swiper_NotSet_static_0300', Level.LEVEL0, async (): Promise<void> => {
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("SwiperF"))
      console.info('ArkUX_Stage_Swiper_NotSet_static_0300 showBackground :' +
      JSON.stringify(obj.getElement('$attrs').getElement('showBackground')));
      console.info('ArkUX_Stage_Swiper_NotSet_static_0300 isSidebarMiddle :' +
      JSON.stringify(obj.getElement('$attrs').getElement('isSidebarMiddle')));
      console.info('ArkUX_Stage_Swiper_NotSet_static_0300 backgroundSize :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowBackgroundSize')));
      console.info('ArkUX_Stage_Swiper_NotSet_static_0300 backgroundColor :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowBackgroundColor')));
      console.info('ArkUX_Stage_Swiper_NotSet_static_0300 arrowSize :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowSize')));
      console.info('ArkUX_Stage_Swiper_NotSet_static_0300 arrowColor :' +
      JSON.stringify(obj.getElement('$attrs').getString('arrowColor')));
      console.info('ArkUX_Stage_Swiper_NotSet_static_0300 displayArrow :' +
      JSON.stringify(obj.getElement('$attrs').getString('displayArrow')));
      console.info('ArkUX_Stage_Swiper_NotSet_static_0300 isHoverShow :' +
      JSON.stringify(obj.getElement('$attrs').getString('hoverShow')));
      let backgroundSize = obj.getElement('$attrs').getString('arrowBackgroundSize');
      expect(Number.parseFloat(backgroundSize)).assertEqual(0)
      expect(backgroundSize.substr(backgroundSize.length - 2, 2)).assertEqual("vp")
      let arrowSize = obj.getElement('$attrs').getString('arrowSize');
      expect(Number.parseFloat(arrowSize)).assertEqual(0)
      expect(arrowSize.substr(arrowSize.length - 2, 2)).assertEqual("vp")
      expect(obj.getElement('$attrs').getString('showBackground')).assertEqual("false")
      expect(obj.getElement('$attrs').getString('isSidebarMiddle')).assertEqual("false")
      expect(obj.getElement('$attrs').getString('arrowBackgroundColor')).assertEqual("#00000000")
      expect(obj.getElement('$attrs').getString('arrowColor')).assertEqual("#00000000")
      expect(obj.getElement('$attrs').getString('displayArrow')).assertEqual("false")
      expect(obj.getElement('$attrs').getString('hoverShow')).assertEqual("false")
    })
  })
}