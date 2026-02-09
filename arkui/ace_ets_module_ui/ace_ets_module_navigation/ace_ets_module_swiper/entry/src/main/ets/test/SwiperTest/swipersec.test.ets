/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';

function sleep(time: number) {
  return new Promise<string>((resolve, reject) => {
    setTimeout(() => {
      resolve("ok")
    }, time)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}

async function setArrowStyle(arrowStyle: ESObject) {
  try {
    let backData: events_emitter.EventData = {
      data: {
        "arrowStyle": JSON.stringify(arrowStyle)
      }
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

async function setBoolean(type: string, displayArrow: ESObject) {
  try {
    let backData: events_emitter.EventData = {
      data: {
        "type": type,
        "displayArrow": displayArrow
      }
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

export default function swiperSecTest() {

  describe('ActsAbilityTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Swiper/Swipersec",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Swipersec state success " + JSON.stringify(pages));
        if (!("Swipersec" == pages.name)) {
          console.info("get Swipersec state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push Swipersec page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Swipersec page error " + JSON.stringify(err));
      }
      await sleep(2)
      done()
    });
    afterEach(async (done: Function) => {
      await setArrowStyle(
        {}
      )
      done()
    });


    /**
     * @tc.name   ArkUX_Stage_Swiper_showBackground_0100
     * @tc.number ArkUX_Stage_Swiper_showBackground_0100
     * @tc.desc   Set the isShowBoard property parameter to true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_showBackground_0100', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          showBackground: true
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      expect(obj.$attrs.showBackground).assertEqual("true")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_showBackground_0200
     * @tc.number ArkUX_Stage_Swiper_showBackground_0200
     * @tc.desc   Set the isShowBoard property parameter to 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_showBackground_0200', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          showBackground: 1
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      expect(obj.$attrs.showBackground).assertEqual("false")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_showBackground_0300
     * @tc.number ArkUX_Stage_Swiper_showBackground_0300
     * @tc.desc   Set the isShowBoard property parameter to "true"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_showBackground_0300', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          showBackground: "true"
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      expect(obj.$attrs.showBackground).assertEqual("false")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_showBackground_0400
     * @tc.number ArkUX_Stage_Swiper_showBackground_0400
     * @tc.desc   Set the isShowBoard property parameter to "false"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_showBackground_0400', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          showBackground: "false",
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      expect(obj.$attrs.showBackground).assertEqual("false")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_showBackground_0500
     * @tc.number ArkUX_Stage_Swiper_showBackground_0500
     * @tc.desc   Set the isShowBoard property parameter to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_showBackground_0500', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          showBackground: 0
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      expect(obj.$attrs.showBackground).assertEqual("false")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_showBackground_0600
     * @tc.number ArkUX_Stage_Swiper_showBackground_0600
     * @tc.desc   Set the isShowBoard property parameter to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_showBackground_0600', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          showBackground: false
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      expect(obj.$attrs.showBackground).assertEqual("false")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_showBackground_0700
     * @tc.number ArkUX_Stage_Swiper_showBackground_0700
     * @tc.desc   Set the isShowBoard property parameter to ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_showBackground_0700', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          showBackground: ""
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      expect(obj.$attrs.showBackground).assertEqual("false")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_showBackground_0800
     * @tc.number ArkUX_Stage_Swiper_showBackground_0800
     * @tc.desc   Set the isShowBoard property parameter to undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_showBackground_0800', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          showBackground: undefined
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      expect(obj.$attrs.showBackground).assertEqual("false")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_showBackground_0900
     * @tc.number ArkUX_Stage_Swiper_showBackground_0900
     * @tc.desc   Set the isShowBoard property parameter to null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_showBackground_0900', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          showBackground: null
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      expect(obj.$attrs.showBackground).assertEqual("false")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_IsSidebarMiddle_0100
     * @tc.number ArkUX_Stage_Swiper_IsSidebarMiddle_0100
     * @tc.desc   Set the isSidebarMiddle property parameter to true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_IsSidebarMiddle_0100', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          isSidebarMiddle: true
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      expect(obj.$attrs.isSidebarMiddle).assertEqual("true")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_IsSidebarMiddle_0200
     * @tc.number ArkUX_Stage_Swiper_IsSidebarMiddle_0200
     * @tc.desc   Set the isSidebarMiddle property parameter to 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_IsSidebarMiddle_0200', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          isSidebarMiddle: 1
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      expect(obj.$attrs.isSidebarMiddle).assertEqual("false")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_IsSidebarMiddle_0300
     * @tc.number ArkUX_Stage_Swiper_IsSidebarMiddle_0300
     * @tc.desc   Set the isSidebarMiddle property parameter to "true"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_IsSidebarMiddle_0300', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          isSidebarMiddle: "true"
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      expect(obj.$attrs.isSidebarMiddle).assertEqual("false")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_IsSidebarMiddle_0400
     * @tc.number ArkUX_Stage_Swiper_IsSidebarMiddle_0400
     * @tc.desc   Set the isSidebarMiddle property parameter to "false"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_IsSidebarMiddle_0400', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          isSidebarMiddle: "false",
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      expect(obj.$attrs.isSidebarMiddle).assertEqual("false")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_IsSidebarMiddle_0500
     * @tc.number ArkUX_Stage_Swiper_IsSidebarMiddle_0500
     * @tc.desc   Set the isSidebarMiddle property parameter to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_IsSidebarMiddle_0500', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          isSidebarMiddle: 0
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      expect(obj.$attrs.isSidebarMiddle).assertEqual("false")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_IsSidebarMiddle_0600
     * @tc.number ArkUX_Stage_Swiper_IsSidebarMiddle_0600
     * @tc.desc   Set the isSidebarMiddle property parameter to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_IsSidebarMiddle_0600', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          isSidebarMiddle: false
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      expect(obj.$attrs.isSidebarMiddle).assertEqual("false")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_IsSidebarMiddle_0700
     * @tc.number ArkUX_Stage_Swiper_IsSidebarMiddle_0700
     * @tc.desc   Set the isSidebarMiddle property parameter to ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_IsSidebarMiddle_0700', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          isSidebarMiddle: ""
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      expect(obj.$attrs.isSidebarMiddle).assertEqual("false")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_IsSidebarMiddle_0800
     * @tc.number ArkUX_Stage_Swiper_IsSidebarMiddle_0800
     * @tc.desc   Set the isSidebarMiddle property parameter to undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_IsSidebarMiddle_0800', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          isSidebarMiddle: undefined
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      expect(obj.$attrs.isSidebarMiddle).assertEqual("false")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_IsSidebarMiddle_0900
     * @tc.number ArkUX_Stage_Swiper_IsSidebarMiddle_0900
     * @tc.desc   Set the isSidebarMiddle property parameter to null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_IsSidebarMiddle_0900', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          isSidebarMiddle: null
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      expect(obj.$attrs.isSidebarMiddle).assertEqual("false")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_BackgroundSize_0100
     * @tc.number ArkUX_Stage_Swiper_BackgroundSize_0100
     * @tc.desc   Set the backgroundSize property parameter to 34
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_BackgroundSize_0100', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          showBackground: true,
          backgroundSize: 34
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_BackgroundSize_0100 BackgroundSize :' +
      JSON.stringify(obj.$attrs.arrowBackgroundSize));
      let backgroundSize: ESObject = obj.$attrs.arrowBackgroundSize;
      expect(Number.parseFloat(backgroundSize)).assertEqual(34)
      expect(backgroundSize.substr(backgroundSize.length - 2, 2)).assertEqual("vp")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_BackgroundSize_0200
     * @tc.number ArkUX_Stage_Swiper_BackgroundSize_0200
     * @tc.desc   Set the backgroundSize property parameter to "20px"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_BackgroundSize_0200', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          showBackground: true,
          backgroundSize: "20px"
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_BackgroundSize_0200 BackgroundSize :'
        + JSON.stringify(obj.$attrs.arrowBackgroundSize));
      let backgroundSize: ESObject = obj.$attrs.arrowBackgroundSize;
      expect(Number.parseFloat(backgroundSize)).assertEqual(20)
      expect(backgroundSize.substr(backgroundSize.length - 2, 2)).assertEqual("px")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_BackgroundSize_0300
     * @tc.number ArkUX_Stage_Swiper_BackgroundSize_0300
     * @tc.desc   Set the backgroundSize property parameter to "48%"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_BackgroundSize_0300', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          showBackground: true,
          isSidebarMiddle: true,
          backgroundSize: "48%"
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_BackgroundSize_0300 BackgroundSize :' +
      JSON.stringify(obj.$attrs.arrowBackgroundSize));
      let backgroundSize: ESObject = obj.$attrs.arrowBackgroundSize;
      expect(Number.parseFloat(backgroundSize)).assertEqual(32)
      expect(backgroundSize.substr(backgroundSize.length - 2, 2)).assertEqual("vp")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_BackgroundSize_0400
     * @tc.number ArkUX_Stage_Swiper_BackgroundSize_0400
     * @tc.desc   Set the backgroundSize property parameter to ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_BackgroundSize_0400', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          showBackground: true,
          backgroundSize: ""
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_BackgroundSize_0400 BackgroundSize :' +
      JSON.stringify(obj.$attrs.arrowBackgroundSize));
      let backgroundSize: ESObject = obj.$attrs.arrowBackgroundSize;
      expect(Number.parseFloat(backgroundSize)).assertEqual(24)
      expect(backgroundSize.substr(backgroundSize.length - 2, 2)).assertEqual("vp")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_BackgroundSize_0500
     * @tc.number ArkUX_Stage_Swiper_BackgroundSize_0500
     * @tc.desc   Set the isSidebarMiddle property parameter to true and backgroundSize property parameter to "-2"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_BackgroundSize_0500', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          isSidebarMiddle: true,
          backgroundSize: "-2",
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_BackgroundSize_0500 BackgroundSize :' +
      JSON.stringify(obj.$attrs.arrowBackgroundSize));
      let backgroundSize: ESObject = obj.$attrs.arrowBackgroundSize;
      expect(Number.parseFloat(backgroundSize)).assertEqual(24)
      expect(backgroundSize.substr(backgroundSize.length - 2, 2)).assertEqual("vp")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_BackgroundSize_0600
     * @tc.number ArkUX_Stage_Swiper_BackgroundSize_0600
     * @tc.desc   Set the isSidebarMiddle property parameter to false and backgroundSize property parameter to "-2"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_BackgroundSize_0600', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          isSidebarMiddle: false,
          backgroundSize: "-2",
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_BackgroundSize_0600 BackgroundSize :' +
      JSON.stringify(obj.$attrs.arrowBackgroundSize));
      let backgroundSize: ESObject = obj.$attrs.arrowBackgroundSize;
      expect(Number.parseFloat(backgroundSize)).assertEqual(18)
      expect(backgroundSize.substr(backgroundSize.length - 2, 2)).assertEqual("vp")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_BackgroundSize_0700
     * @tc.number ArkUX_Stage_Swiper_BackgroundSize_0700
     * @tc.desc   Set the backgroundSize property parameter to "abc"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_BackgroundSize_0700', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          showBackground: true,
          backgroundSize: "abc"
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_BackgroundSize_0700 BackgroundSize :' +
      JSON.stringify(obj.$attrs.arrowBackgroundSize));
      let backgroundSize: ESObject = obj.$attrs.arrowBackgroundSize;
      expect(Number.parseFloat(backgroundSize)).assertEqual(24)
      expect(backgroundSize.substr(backgroundSize.length - 2, 2)).assertEqual("vp")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_BackgroundSize_0800
     * @tc.number ArkUX_Stage_Swiper_BackgroundSize_0800
     * @tc.desc   Set the backgroundSize property parameter to "1000%"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_BackgroundSize_0800', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          showBackground: true,
          backgroundSize: "1000%"
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_BackgroundSize_0800 BackgroundSize :' +
      JSON.stringify(obj.$attrs.arrowBackgroundSize));
      let backgroundSize: ESObject = obj.$attrs.arrowBackgroundSize;
      expect(Number.parseFloat(backgroundSize)).assertEqual(24)
      expect(backgroundSize.substr(backgroundSize.length - 2, 2)).assertEqual("vp")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_BackgroundSize_0900
     * @tc.number ArkUX_Stage_Swiper_BackgroundSize_0900
     * @tc.desc   Set the backgroundSize property parameter to "100fp"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_BackgroundSize_0900', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          showBackground: true,
          backgroundSize: "100fp"
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_BackgroundSize_0900 BackgroundSize :' +
      JSON.stringify(obj.$attrs.arrowBackgroundSize));
      let backgroundSize: ESObject = obj.$attrs.arrowBackgroundSize;
      expect(Number.parseFloat(backgroundSize)).assertEqual(100)
      expect(backgroundSize.substr(backgroundSize.length - 2, 2)).assertEqual("fp")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_BackgroundSize_1000
     * @tc.number ArkUX_Stage_Swiper_BackgroundSize_1000
     * @tc.desc   Set the baseboard size parameters twice normally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_BackgroundSize_1000', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          showBackground: true,
          backgroundSize: 10
        }
      )
      await setArrowStyle(
        {
          showBackground: true,
          backgroundSize: "42lpx"
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_BackgroundSize_1000 BackgroundSize :' +
      JSON.stringify(obj.$attrs.arrowBackgroundSize));
      let backgroundSize: ESObject = obj.$attrs.arrowBackgroundSize;
      expect(Number.parseFloat(backgroundSize)).assertEqual(42)
      expect(backgroundSize.substr(backgroundSize.length - 3, 3)).assertEqual("lpx")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_BackgroundSize_1100
     * @tc.number ArkUX_Stage_Swiper_BackgroundSize_1100
     * @tc.desc   Set the baseboard size parameters to normal before abnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_BackgroundSize_1100', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          showBackground: true,
          backgroundSize: 10
        }
      )
      await setArrowStyle(
        {
          showBackground: true,
          backgroundSize: "abc"
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_BackgroundSize_1100 BackgroundSize :'
        + JSON.stringify(obj.$attrs.arrowBackgroundSize));
      let backgroundSize: ESObject = obj.$attrs.arrowBackgroundSize;
      expect(Number.parseFloat(backgroundSize)).assertEqual(24)
      expect(backgroundSize.substr(backgroundSize.length - 2, 2)).assertEqual("vp")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_BackgroundSize_1200
     * @tc.number ArkUX_Stage_Swiper_BackgroundSize_1200
     * @tc.desc   Set the baseboard size parameter to abnormal before normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_BackgroundSize_1200', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          showBackground: true,
          backgroundSize: "abc"
        }
      )
      await setArrowStyle(
        {
          showBackground: true,
          backgroundSize: 10
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_BackgroundSize_1200 BackgroundSize :'
        + JSON.stringify(obj.$attrs.arrowBackgroundSize));
      let backgroundSize: ESObject = obj.$attrs.arrowBackgroundSize;
      expect(Number.parseFloat(backgroundSize)).assertEqual(10)
      expect(backgroundSize.substr(backgroundSize.length - 2, 2)).assertEqual("vp")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_BackgroundColor_0100
     * @tc.number ArkUX_Stage_Swiper_BackgroundColor_0100
     * @tc.desc   Set the backgroundColor property parameter to 0x00ff00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_BackgroundColor_0100', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          backgroundColor: 0x00ff00
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_BackgroundColor_0100 BackgroundColor :'
        + JSON.stringify(obj.$attrs.arrowBackgroundColor));
      expect(obj.$attrs.arrowBackgroundColor).assertEqual("#FF00FF00")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_BackgroundColor_0200
     * @tc.number ArkUX_Stage_Swiper_BackgroundColor_0200
     * @tc.desc   Set the backgroundColor property parameter to "#FFFF0000"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_BackgroundColor_0200', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          backgroundColor: "#FFFF0000"
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_BackgroundColor_0200 BackgroundColor :' +
      JSON.stringify(obj.$attrs.arrowBackgroundColor));
      expect(obj.$attrs.arrowBackgroundColor).assertEqual("#FFFF0000")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_BackgroundColor_0300
     * @tc.number ArkUX_Stage_Swiper_BackgroundColor_0300
     * @tc.desc   Set the backgroundColor property parameter to "rgb(138,43,226)"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_BackgroundColor_0300', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          backgroundColor: "rgb(138,43,226)"
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_BackgroundColor_0300 BackgroundColor :' +
      JSON.stringify(obj.$attrs.arrowBackgroundColor));
      expect(obj.$attrs.arrowBackgroundColor).assertEqual("#FF8A2BE2")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_BackgroundColor_0400
     * @tc.number ArkUX_Stage_Swiper_BackgroundColor_0400
     * @tc.desc   Set the backgroundColor property parameter to Color.Pink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_BackgroundColor_0400', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          backgroundColor: Color.Pink
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_BackgroundColor_0400 BackgroundColor :' +
      JSON.stringify(obj.$attrs.arrowBackgroundColor));
      expect(obj.$attrs.arrowBackgroundColor).assertEqual("#FFFFC0CB")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_BackgroundColor_0500
     * @tc.number ArkUX_Stage_Swiper_BackgroundColor_0500
     * @tc.desc   Set the isSidebarMiddle property parameter to true and
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_BackgroundColor_0500', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          isSidebarMiddle: true,
          backgroundColor: ""
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_BackgroundColor_0500 BackgroundColor :' +
      JSON.stringify(obj.$attrs.arrowBackgroundColor));
      expect(obj.$attrs.arrowBackgroundColor).assertEqual(obj.$attrs.backgroundColor)
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_BackgroundColor_0600
     * @tc.number ArkUX_Stage_Swiper_BackgroundColor_0600
     * @tc.desc   Set the isSidebarMiddle property parameter to false and
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_BackgroundColor_0600', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          isSidebarMiddle: false,
          backgroundColor: ""
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_BackgroundColor_0600 BackgroundColor :' +
      JSON.stringify(obj.$attrs.arrowBackgroundColor));
      expect(obj.$attrs.arrowBackgroundColor).assertEqual("#00000000")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_BackgroundColor_0700
     * @tc.number ArkUX_Stage_Swiper_BackgroundColor_0700
     * @tc.desc   Set the isSidebarMiddle property parameter to true and
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_BackgroundColor_0700', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          isSidebarMiddle: true,
          backgroundColor: null
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_BackgroundColor_0700 BackgroundColor :' +
      JSON.stringify(obj.$attrs.arrowBackgroundColor));
      expect(obj.$attrs.arrowBackgroundColor).assertEqual(obj.$attrs.backgroundColor)
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_BackgroundColor_0800
     * @tc.number ArkUX_Stage_Swiper_BackgroundColor_0800
     * @tc.desc   Set the isSidebarMiddle property parameter to false and
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_BackgroundColor_0800', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          isSidebarMiddle: false,
          backgroundColor: null
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_BackgroundColor_0800 BackgroundColor :' +
      JSON.stringify(obj.$attrs.arrowBackgroundColor));
      expect(obj.$attrs.arrowBackgroundColor).assertEqual("#00000000")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_BackgroundColor_0900
     * @tc.number ArkUX_Stage_Swiper_BackgroundColor_0900
     * @tc.desc   Set the backgroundColor property parameter to $r("app.color.swiper_BackgroundColor_test")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_BackgroundColor_0900', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          backgroundColor: $r("app.color.swiper_BackgroundColor_test")
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_BackgroundColor_0900 BackgroundColor :' +
      JSON.stringify(obj.$attrs.arrowBackgroundColor));
      expect(obj.$attrs.arrowBackgroundColor).assertEqual("#FFFF0000")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_BackgroundColor_1000
     * @tc.number ArkUX_Stage_Swiper_BackgroundColor_1000
     * @tc.desc   Set the isSidebarMiddle property parameter to true and
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_BackgroundColor_1000', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          isSidebarMiddle: true,
          backgroundColor: "bgr(138,43,226)"
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_BackgroundColor_1000 BackgroundColor :' +
      JSON.stringify(obj.$attrs.arrowBackgroundColor));
      expect(obj.$attrs.arrowBackgroundColor).assertEqual(obj.$attrs.backgroundColor)
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_BackgroundColor_1100
     * @tc.number ArkUX_Stage_Swiper_BackgroundColor_1100
     * @tc.desc   Set the isSidebarMiddle property parameter to false and
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_BackgroundColor_1100', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          isSidebarMiddle: false,
          backgroundColor: "bgr(138,43,226)"
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_BackgroundColor_1100 BackgroundColor :' +
      JSON.stringify(obj.$attrs.arrowBackgroundColor));
      expect(obj.$attrs.arrowBackgroundColor).assertEqual("#00000000")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_BackgroundColor_1200
     * @tc.number ArkUX_Stage_Swiper_BackgroundColor_1200
     * @tc.desc   Set the isSidebarMiddle property parameter to true and
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_BackgroundColor_1200', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          isSidebarMiddle: true,
          backgroundColor: undefined
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_BackgroundColor_1200 BackgroundColor :' +
      JSON.stringify(obj.$attrs.arrowBackgroundColor));
      expect(obj.$attrs.arrowBackgroundColor).assertEqual(obj.$attrs.backgroundColor)
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_BackgroundColor_1300
     * @tc.number ArkUX_Stage_Swiper_BackgroundColor_1300
     * @tc.desc   Set the isSidebarMiddle property parameter to false and
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_BackgroundColor_1300', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          isSidebarMiddle: false,
          backgroundColor: undefined
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_BackgroundColor_1300 BackgroundColor :' +
      JSON.stringify(obj.$attrs.arrowBackgroundColor));
      expect(obj.$attrs.arrowBackgroundColor).assertEqual("#00000000")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_BackgroundColor_1400
     * @tc.number ArkUX_Stage_Swiper_BackgroundColor_1400
     * @tc.desc   Set the backgroundColor property parameter to normal twice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_BackgroundColor_1400', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          backgroundColor: "rgb(138,43,226)"
        }
      )
      await setArrowStyle(
        {
          backgroundColor: Color.Gray
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_BackgroundColor_1400 BackgroundColor :' +
      JSON.stringify(obj.$attrs.arrowBackgroundColor));
      expect(obj.$attrs.arrowBackgroundColor).assertEqual("#FF808080")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_BackgroundColor_1500
     * @tc.number ArkUX_Stage_Swiper_BackgroundColor_1500
     * @tc.desc   Set the backgroundColor property parameter to normal first and then abnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_BackgroundColor_1500', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          backgroundColor: "rgb(255,0,0)"
        }
      )
      await setArrowStyle(
        {
          isSidebarMiddle: true,
          backgroundColor: undefined
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_BackgroundColor_1500 BackgroundColor :' +
      JSON.stringify(obj.$attrs.arrowBackgroundColor));
      expect(obj.$attrs.arrowBackgroundColor).assertEqual(obj.$attrs.backgroundColor)
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_BackgroundColor_1600
     * @tc.number ArkUX_Stage_Swiper_BackgroundColor_1600
     * @tc.desc   Set the backgroundColor property parameter to first exception and then normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_BackgroundColor_1600', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          backgroundColor: undefined,
        }
      )
      await setArrowStyle(
        {
          backgroundColor: "rgb(255,0,0)",
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_BackgroundColor_1600 BackgroundColor :' +
      JSON.stringify(obj.$attrs.arrowBackgroundColor));
      expect(obj.$attrs.arrowBackgroundColor).assertEqual("#FFFF0000")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_ArrowSize_0100
     * @tc.number ArkUX_Stage_Swiper_ArrowSize_0100
     * @tc.desc   Set the showBackground property parameter to false and
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_ArrowSize_0100', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          showBackground: false,
          backgroundSize: 12,
          arrowSize: 34
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_ArrowSize_0100 arrowSize :' + JSON.stringify(obj.$attrs.arrowSize));
      let arrowSize: ESObject = obj.$attrs.arrowSize;
      expect(Number.parseFloat(arrowSize)).assertEqual(34)
      expect(arrowSize.substr(arrowSize.length - 2, 2)).assertEqual("vp")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_ArrowSize_0200
     * @tc.number ArkUX_Stage_Swiper_ArrowSize_0200
     * @tc.desc   Set the showBackground property parameter to true and
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_ArrowSize_0200', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          showBackground: true,
          backgroundSize: 12,
          arrowSize: 34
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_ArrowSize_0200 arrowSize :' + JSON.stringify(obj.$attrs.arrowSize));
      let arrowSize: ESObject = obj.$attrs.arrowSize;
      expect(Number.parseFloat(arrowSize)).assertEqual(9)
      expect(arrowSize.substr(arrowSize.length - 2, 2)).assertEqual("vp")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_ArrowSize_0300
     * @tc.number ArkUX_Stage_Swiper_ArrowSize_0300
     * @tc.desc   Set the showBackground property parameter to false and
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_ArrowSize_0300', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          showBackground: false,
          isSidebarMiddle: false,
          arrowSize: "20px"
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_ArrowSize_0300 arrowSize :' + JSON.stringify(obj.$attrs.arrowSize));
      let arrowSize: ESObject = obj.$attrs.arrowSize;
      expect(Number.parseFloat(arrowSize)).assertEqual(20)
      expect(arrowSize.substr(arrowSize.length - 2, 2)).assertEqual("px")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_ArrowSize_0400
     * @tc.number ArkUX_Stage_Swiper_ArrowSize_0400
     * @tc.desc   Set the showBackground property parameter to true and
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_ArrowSize_0400', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          showBackground: true,
          isSidebarMiddle: true,
          arrowSize: "20px"
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_ArrowSize_0400 arrowSize :' + JSON.stringify(obj.$attrs.arrowSize));
      let arrowSize: ESObject = obj.$attrs.arrowSize;
      expect(Number.parseFloat(arrowSize)).assertEqual(24)
      expect(arrowSize.substr(arrowSize.length - 2, 2)).assertEqual("vp")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_ArrowSize_0500
     * @tc.number ArkUX_Stage_Swiper_ArrowSize_0500
     * @tc.desc   Set the showBackground property parameter to true and
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_ArrowSize_0500', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          showBackground: true,
          isSidebarMiddle: false,
          arrowSize: "20px"
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_ArrowSize_0500 arrowSize :' + JSON.stringify(obj.$attrs.arrowSize));
      let arrowSize: ESObject = obj.$attrs.arrowSize;
      expect(Number.parseFloat(arrowSize)).assertEqual(18)
      expect(arrowSize.substr(arrowSize.length - 2, 2)).assertEqual("vp")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_ArrowSize_0600
     * @tc.number ArkUX_Stage_Swiper_ArrowSize_0600
     * @tc.desc   Set the arrowSize property parameter to "48%"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_ArrowSize_0600', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          arrowSize: "48%"
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_ArrowSize_0600 arrowSize :' + JSON.stringify(obj.$attrs.arrowSize));
      let arrowSize: ESObject = obj.$attrs.arrowSize;
      expect(Number.parseFloat(arrowSize)).assertEqual(18)
      expect(arrowSize.substr(arrowSize.length - 2, 2)).assertEqual("vp")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_ArrowSize_0700
     * @tc.number ArkUX_Stage_Swiper_ArrowSize_0700
     * @tc.desc   Set the arrowSize property parameter to ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_ArrowSize_0700', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          arrowSize: ""
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_ArrowSize_0700 arrowSize :' + JSON.stringify(obj.$attrs.arrowSize));
      let arrowSize: ESObject = obj.$attrs.arrowSize;
      expect(Number.parseFloat(arrowSize)).assertEqual(18)
      expect(arrowSize.substr(arrowSize.length - 2, 2)).assertEqual("vp")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_ArrowSize_0800
     * @tc.number ArkUX_Stage_Swiper_ArrowSize_0800
     * @tc.desc   Set the isSidebarMiddle property parameter to true and
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_ArrowSize_0800', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          isSidebarMiddle: true,
          showBackground: true,
          backgroundSize: 12,
          arrowSize: "-2"
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_ArrowSize_0800 arrowSize :' + JSON.stringify(obj.$attrs.arrowSize));
      let arrowSize: ESObject = obj.$attrs.arrowSize;
      expect(Number.parseFloat(arrowSize)).assertEqual(9)
      expect(arrowSize.substr(arrowSize.length - 2, 2)).assertEqual("vp")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_ArrowSize_0900
     * @tc.number ArkUX_Stage_Swiper_ArrowSize_0900
     * @tc.desc   Set the isSidebarMiddle property parameter to true and
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_ArrowSize_0900', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          isSidebarMiddle: true,
          showBackground: false,
          backgroundSize: 12,
          arrowSize: "-2"
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_ArrowSize_0900 arrowSize :' + JSON.stringify(obj.$attrs.arrowSize));
      let arrowSize: ESObject = obj.$attrs.arrowSize;
      expect(Number.parseFloat(arrowSize)).assertEqual(24)
      expect(arrowSize.substr(arrowSize.length - 2, 2)).assertEqual("vp")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_ArrowSize_1000
     * @tc.number ArkUX_Stage_Swiper_ArrowSize_1000
     * @tc.desc   Set the showBackground property parameter to false and
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_ArrowSize_1000', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          showBackground: false,
          isSidebarMiddle: false,
          backgroundSize: 12,
          arrowSize: "-2"
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_ArrowSize_1000 arrowSize :' + JSON.stringify(obj.$attrs.arrowSize));
      let arrowSize: ESObject = obj.$attrs.arrowSize;
      expect(Number.parseFloat(arrowSize)).assertEqual(18)
      expect(arrowSize.substr(arrowSize.length - 2, 2)).assertEqual("vp")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_ArrowSize_1100
     * @tc.number ArkUX_Stage_Swiper_ArrowSize_1100
     * @tc.desc   Set the arrowSize property parameter to "abc"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_ArrowSize_1100', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          arrowSize: "abc"
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_ArrowSize_1100 arrowSize :' + JSON.stringify(obj.$attrs.arrowSize));
      let arrowSize: ESObject = obj.$attrs.arrowSize;
      expect(Number.parseFloat(arrowSize)).assertEqual(18)
      expect(arrowSize.substr(arrowSize.length - 2, 2)).assertEqual("vp")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_ArrowSize_1200
     * @tc.number ArkUX_Stage_Swiper_ArrowSize_1200
     * @tc.desc   Set the arrowSize property parameter to "1000%"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_ArrowSize_1200', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          arrowSize: "1000%"
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_ArrowSize_1200 arrowSize :' + JSON.stringify(obj.$attrs.arrowSize));
      let arrowSize: ESObject = obj.$attrs.arrowSize;
      expect(Number.parseFloat(arrowSize)).assertEqual(18)
      expect(arrowSize.substr(arrowSize.length - 2, 2)).assertEqual("vp")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_ArrowSize_1300
     * @tc.number ArkUX_Stage_Swiper_ArrowSize_1300
     * @tc.desc   Set the arrowSize property parameter to "100fp"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_ArrowSize_1300', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          arrowSize: "100fp"
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_ArrowSize_1300 arrowSize :' + JSON.stringify(obj.$attrs.arrowSize));
      let arrowSize: ESObject = obj.$attrs.arrowSize;
      expect(Number.parseFloat(arrowSize)).assertEqual(100)
      expect(arrowSize.substr(arrowSize.length - 2, 2)).assertEqual("fp")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_ArrowSize_1400
     * @tc.number ArkUX_Stage_Swiper_ArrowSize_1400
     * @tc.desc   Set the arrow size property parameter twice normally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_ArrowSize_1400', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          arrowSize: 10
        }
      )
      await setArrowStyle(
        {
          arrowSize: "42lpx"
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_ArrowSize_1400 arrowSize :' + JSON.stringify(obj.$attrs.arrowSize));
      let arrowSize: ESObject = obj.$attrs.arrowSize;
      expect(Number.parseFloat(arrowSize)).assertEqual(42)
      expect(arrowSize.substr(arrowSize.length - 3, 3)).assertEqual("lpx")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_ArrowSize_1500
     * @tc.number ArkUX_Stage_Swiper_ArrowSize_1500
     * @tc.desc   Set the arrow size property parameters to normal and then abnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_ArrowSize_1500', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          arrowSize: 10
        }
      )
      await setArrowStyle(
        {
          arrowSize: "abc"
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_ArrowSize_1500 arrowSize :' + JSON.stringify(obj.$attrs.arrowSize));
      let arrowSize: ESObject = obj.$attrs.arrowSize;
      expect(Number.parseFloat(arrowSize)).assertEqual(18)
      expect(arrowSize.substr(arrowSize.length - 2, 2)).assertEqual("vp")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_ArrowSize_1600
     * @tc.number ArkUX_Stage_Swiper_ArrowSize_1600
     * @tc.desc   Set the arrow size property parameter to abnormal and then normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_ArrowSize_1600', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          arrowSize: "abc"
        }
      )
      await setArrowStyle(
        {
          arrowSize: 10
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_ArrowSize_1600 arrowSize :' + JSON.stringify(obj.$attrs.arrowSize));
      let arrowSize: ESObject = obj.$attrs.arrowSize;
      expect(Number.parseFloat(arrowSize)).assertEqual(10)
      expect(arrowSize.substr(arrowSize.length - 2, 2)).assertEqual("vp")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_ArrowColor_0100
     * @tc.number ArkUX_Stage_Swiper_ArrowColor_0100
     * @tc.desc   Set the arrow color property parameters to 0x00ff00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_ArrowColor_0100', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          arrowColor: 0x00ff00
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_ArrowColor_0100 arrowColor :' + JSON.stringify(obj.$attrs.arrowColor));
      expect(obj.$attrs.arrowColor).assertEqual("#FF00FF00")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_ArrowColor_0200
     * @tc.number ArkUX_Stage_Swiper_ArrowColor_0200
     * @tc.desc   Set the arrow color property parameters to "#FFFF0000"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_ArrowColor_0200', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          arrowColor: "#FFFF0000"
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_ArrowColor_0200 arrowColor :' + JSON.stringify(obj.$attrs.arrowColor));
      expect(obj.$attrs.arrowColor).assertEqual("#FFFF0000")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_ArrowColor_0300
     * @tc.number ArkUX_Stage_Swiper_ArrowColor_0300
     * @tc.desc   Set the arrow color property parameters to "rgb(138,43,226)"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_ArrowColor_0300', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          arrowColor: "rgb(138,43,226)"
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_ArrowColor_0300 arrowColor :' + JSON.stringify(obj.$attrs.arrowColor));
      expect(obj.$attrs.arrowColor).assertEqual("#FF8A2BE2")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_ArrowColor_0400
     * @tc.number ArkUX_Stage_Swiper_ArrowColor_0400
     * @tc.desc   Set the arrow color property parameters to Color.Pink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_ArrowColor_0400', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          arrowColor: Color.Pink
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_ArrowColor_0400 arrowColor :' + JSON.stringify(obj.$attrs.arrowColor));
      expect(obj.$attrs.arrowColor).assertEqual("#FFFFC0CB")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_ArrowColor_0500
     * @tc.number ArkUX_Stage_Swiper_ArrowColor_0500
     * @tc.desc   Set the arrow color property parameters to ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_ArrowColor_0500', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          arrowColor: ""
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_ArrowColor_0500 arrowColor :' + JSON.stringify(obj.$attrs.arrowColor));
      expect(obj.$attrs.arrowColor).assertEqual(obj.$attrs.foregroundColor)
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_ArrowColor_0600
     * @tc.number ArkUX_Stage_Swiper_ArrowColor_0600
     * @tc.desc   Set the arrow color property parameters to null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_ArrowColor_0600', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          arrowColor: null
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_ArrowColor_0600 arrowColor :' + JSON.stringify(obj.$attrs.arrowColor));
      expect(obj.$attrs.arrowColor).assertEqual(obj.$attrs.foregroundColor)
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_ArrowColor_0700
     * @tc.number ArkUX_Stage_Swiper_ArrowColor_0700
     * @tc.desc   Set the arrow color property parameters to $r("app.color.swiper_BackgroundColor_test")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_ArrowColor_0700', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          arrowColor: $r("app.color.swiper_BackgroundColor_test")
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_ArrowColor_0700 arrowColor :' + JSON.stringify(obj.$attrs.arrowColor));
      expect(obj.$attrs.arrowColor).assertEqual("#FFFF0000")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_ArrowColor_0800
     * @tc.number ArkUX_Stage_Swiper_ArrowColor_0800
     * @tc.desc   Set the arrow color property parameters to "bgr(138,43,226)"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_ArrowColor_0800', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          arrowColor: "bgr(138,43,226)"
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_ArrowColor_0800 arrowColor :' + JSON.stringify(obj.$attrs.arrowColor));
      expect(obj.$attrs.arrowColor).assertEqual(obj.$attrs.foregroundColor)
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_ArrowColor_0900
     * @tc.number ArkUX_Stage_Swiper_ArrowColor_0900
     * @tc.desc   Set the arrow color property parameters to undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_ArrowColor_0900', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          arrowColor: undefined
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_ArrowColor_0900 arrowColor :' + JSON.stringify(obj.$attrs.arrowColor));
      expect(obj.$attrs.arrowColor).assertEqual(obj.$attrs.foregroundColor)
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_ArrowColor_1000
     * @tc.number ArkUX_Stage_Swiper_ArrowColor_1000
     * @tc.desc   Set the arrow color property parameter to normal twice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_ArrowColor_1000', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          arrowColor: "rgb(138,43,226)"
        }
      )
      await setArrowStyle(
        {
          arrowColor: Color.Gray
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_ArrowColor_1000 arrowColor :' + JSON.stringify(obj.$attrs.arrowColor));
      expect(obj.$attrs.arrowColor).assertEqual("#FF808080")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_ArrowColor_1100
     * @tc.number ArkUX_Stage_Swiper_ArrowColor_1100
     * @tc.desc   Set the arrow color property parameters to normal and then abnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_ArrowColor_1100', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          BackgroundColor: "rgb(255,0,0)",
        }
      )
      await setArrowStyle(
        {
          BackgroundColor: undefined
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_ArrowColor_1100 arrowColor :' + JSON.stringify(obj.$attrs.arrowColor));
      expect(obj.$attrs.arrowColor).assertEqual(obj.$attrs.foregroundColor)
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_ArrowColor_1200
     * @tc.number ArkUX_Stage_Swiper_ArrowColor_1200
     * @tc.desc   Set the arrow color property parameter to abnormal and then normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_ArrowColor_1200', Level.LEVEL1, async () => {
      await setArrowStyle(
        {
          arrowColor: undefined
        }
      )
      await setArrowStyle(
        {
          arrowColor: "#FFFF0000"
        }
      )
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperA"))
      console.info('ArkUX_Stage_Swiper_ArrowColor_1200 arrowColor :' + JSON.stringify(obj.$attrs.arrowColor));
      expect(obj.$attrs.arrowColor).assertEqual("#FFFF0000")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_IsArrow_0100
     * @tc.number ArkUX_Stage_Swiper_IsArrow_0100
     * @tc.desc   Set the property parameter of the display arrow to true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_IsArrow_0100', Level.LEVEL1, async () => {
      await setBoolean("BoolTrue", true)
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperB"))
      console.info('ArkUX_Stage_Swiper_IsArrow_0100 displayArrow :' + JSON.stringify(obj.$attrs.displayArrow));
      expect(obj.$attrs.displayArrow).assertEqual("true")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_IsArrow_0200
     * @tc.number ArkUX_Stage_Swiper_IsArrow_0200
     * @tc.desc   Set the property parameter of the display arrow to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_IsArrow_0200', Level.LEVEL1, async () => {
      await setBoolean("BoolFalse", false)
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperB"))
      console.info('ArkUX_Stage_Swiper_IsArrow_0200 displayArrow :' + JSON.stringify(obj.$attrs.displayArrow));
      expect(obj.$attrs.displayArrow).assertEqual("false")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_IsArrow_0300
     * @tc.number ArkUX_Stage_Swiper_IsArrow_0300
     * @tc.desc   Set the property parameter of the display arrow to "true"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_IsArrow_0300', Level.LEVEL1, async () => {
      await setBoolean("BoolErrStr", "true")
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperB"))
      console.info('ArkUX_Stage_Swiper_IsArrow_0300 displayArrow :' + JSON.stringify(obj.$attrs.displayArrow));
      expect(obj.$attrs.displayArrow).assertEqual("true")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_IsArrow_0400
     * @tc.number ArkUX_Stage_Swiper_IsArrow_0400
     * @tc.desc   Set the property parameter of the display arrow to "false"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_IsArrow_0400', Level.LEVEL1, async () => {
      await setBoolean("BoolErrStr", "false")
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperB"))
      console.info('ArkUX_Stage_Swiper_IsArrow_0400 displayArrow :' + JSON.stringify(obj.$attrs.displayArrow));
      expect(obj.$attrs.displayArrow).assertEqual("false")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_IsArrow_0500
     * @tc.number ArkUX_Stage_Swiper_IsArrow_0500
     * @tc.desc   Set the property parameter of the display arrow to undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_IsArrow_0500', Level.LEVEL1, async () => {
      await setBoolean("BoolErrUndefined", undefined)
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperB"))
      console.info('ArkUX_Stage_Swiper_IsArrow_0500 displayArrow :' + JSON.stringify(obj.$attrs.displayArrow));
      expect(obj.$attrs.displayArrow).assertEqual("false")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_IsArrow_0600
     * @tc.number ArkUX_Stage_Swiper_IsArrow_0600
     * @tc.desc   Set the property parameter of the display arrow to undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_IsArrow_0600', Level.LEVEL1, async () => {
      await setBoolean("BoolErrNull", null)
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperB"))
      console.info('ArkUX_Stage_Swiper_IsArrow_0600 displayArrow :' + JSON.stringify(obj.$attrs.displayArrow));
      expect(obj.$attrs.displayArrow).assertEqual("false")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_IsArrow_0700
     * @tc.number ArkUX_Stage_Swiper_IsArrow_0700
     * @tc.desc   Set the property parameter of the display arrow to ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_IsArrow_0700', Level.LEVEL1, async () => {
      await setBoolean("BoolErrStr", "")
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperB"))
      console.info('ArkUX_Stage_Swiper_IsArrow_0700 displayArrow :' + JSON.stringify(obj.$attrs.displayArrow));
      expect(obj.$attrs.displayArrow).assertEqual("false")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_IsArrow_0800
     * @tc.number ArkUX_Stage_Swiper_IsArrow_0800
     * @tc.desc   Set the property parameter of the display arrow to 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_IsArrow_0800', Level.LEVEL1, async () => {
      await setBoolean("BoolErrNum", 1)
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperB"))
      console.info('ArkUX_Stage_Swiper_IsArrow_0800 displayArrow :' + JSON.stringify(obj.$attrs.displayArrow));
      expect(obj.$attrs.displayArrow).assertEqual("true")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_IsHoverShow_0100
     * @tc.number ArkUX_Stage_Swiper_IsHoverShow_0100
     * @tc.desc   Set the isHoverShow property parameter to true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_IsHoverShow_0100', Level.LEVEL1, async () => {
      await setBoolean("BoolTrue", true)
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperC"))
      console.info('ArkUX_Stage_Swiper_IsHoverShow_0100 hoverShow :' + JSON.stringify(obj.$attrs.hoverShow));
      expect(obj.$attrs.hoverShow).assertEqual("true")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_IsHoverShow_0200
     * @tc.number ArkUX_Stage_Swiper_IsHoverShow_0200
     * @tc.desc   Set the isHoverShow property parameter to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_IsHoverShow_0200', Level.LEVEL1, async () => {
      await setBoolean("BoolFalse", false)
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperC"))
      console.info('ArkUX_Stage_Swiper_IsHoverShow_0200 hoverShow :' + JSON.stringify(obj.$attrs.hoverShow));
      expect(obj.$attrs.hoverShow).assertEqual("false")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_IsHoverShow_0300
     * @tc.number ArkUX_Stage_Swiper_IsHoverShow_0300
     * @tc.desc   Set the isHoverShow property parameter to "true"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_IsHoverShow_0300', Level.LEVEL1, async () => {
      await setBoolean("BoolErrStr", "true")
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperC"))
      console.info('ArkUX_Stage_Swiper_IsHoverShow_0300 hoverShow :' + JSON.stringify(obj.$attrs.hoverShow));
      expect(obj.$attrs.hoverShow).assertEqual("true")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_IsHoverShow_0400
     * @tc.number ArkUX_Stage_Swiper_IsHoverShow_0400
     * @tc.desc   Set the isHoverShow property parameter to "false"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_IsHoverShow_0400', Level.LEVEL1, async () => {
      await setBoolean("BoolErrStr", "false")
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperC"))
      console.info('ArkUX_Stage_Swiper_IsHoverShow_0400 hoverShow :' + JSON.stringify(obj.$attrs.hoverShow));
      expect(obj.$attrs.hoverShow).assertEqual("false")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_IsHoverShow_0500
     * @tc.number ArkUX_Stage_Swiper_IsHoverShow_0500
     * @tc.desc   Set the isHoverShow property parameter to undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_IsHoverShow_0500', Level.LEVEL1, async () => {
      await setBoolean("BoolErrUndefined", undefined)
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperC"))
      console.info('ArkUX_Stage_Swiper_IsHoverShow_0500 hoverShow :' + JSON.stringify(obj.$attrs.hoverShow));
      expect(obj.$attrs.hoverShow).assertEqual("false")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_IsHoverShow_0600
     * @tc.number ArkUX_Stage_Swiper_IsHoverShow_0600
     * @tc.desc   Set the isHoverShow property parameter to null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_IsHoverShow_0600', Level.LEVEL1, async () => {
      await setBoolean("BoolErrNull", null)
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperC"))
      console.info('ArkUX_Stage_Swiper_IsHoverShow_0600 hoverShow :' + JSON.stringify(obj.$attrs.hoverShow));
      expect(obj.$attrs.hoverShow).assertEqual("false")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_IsHoverShow_0700
     * @tc.number ArkUX_Stage_Swiper_IsHoverShow_0700
     * @tc.desc   Set the isHoverShow property parameter to ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_IsHoverShow_0700', Level.LEVEL1, async () => {
      await setBoolean("BoolErrStr", "")
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperC"))
      console.info('ArkUX_Stage_Swiper_IsHoverShow_0700 hoverShow :' + JSON.stringify(obj.$attrs.hoverShow));
      expect(obj.$attrs.hoverShow).assertEqual("false")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_IsHoverShow_0800
     * @tc.number ArkUX_Stage_Swiper_IsHoverShow_0800
     * @tc.desc   Set the isHoverShow property parameter to 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_IsHoverShow_0800', Level.LEVEL1, async () => {
      await setBoolean("BoolErrNum", 1)
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperC"))
      console.info('ArkUX_Stage_Swiper_IsHoverShow_0800 hoverShow :' + JSON.stringify(obj.$attrs.hoverShow));
      expect(obj.$attrs.hoverShow).assertEqual("true")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_NotSet_0100
     * @tc.number ArkUX_Stage_Swiper_NotSet_0100
     * @tc.desc   Tests the value of each attribute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_NotSet_0100', Level.LEVEL1, async () => {
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperD"))
      console.info('ArkUX_Stage_Swiper_NotSet_0100 showBackground :' + JSON.stringify(obj.$attrs.showBackground));
      console.info('ArkUX_Stage_Swiper_NotSet_0100 isSidebarMiddle :' + JSON.stringify(obj.$attrs.isSidebarMiddle));
      console.info('ArkUX_Stage_Swiper_NotSet_0100 backgroundSize :' + JSON.stringify(obj.$attrs.arrowBackgroundSize));
      console.info('ArkUX_Stage_Swiper_NotSet_0100 backgroundColor :' + JSON.stringify(obj.$attrs.arrowBackgroundColor));
      console.info('ArkUX_Stage_Swiper_NotSet_0100 arrowSize :' + JSON.stringify(obj.$attrs.arrowSize));
      console.info('ArkUX_Stage_Swiper_NotSet_0100 arrowColor :' + JSON.stringify(obj.$attrs.arrowColor));
      console.info('ArkUX_Stage_Swiper_NotSet_0100 displayArrow :' + JSON.stringify(obj.$attrs.displayArrow));
      console.info('ArkUX_Stage_Swiper_NotSet_0100 isHoverShow :' + JSON.stringify(obj.$attrs.hoverShow));
      let backgroundSize: ESObject = obj.$attrs.arrowBackgroundSize;
      expect(Number.parseFloat(backgroundSize)).assertEqual(18)
      expect(backgroundSize.substr(backgroundSize.length - 2, 2)).assertEqual("vp")
      let arrowSize: ESObject = obj.$attrs.arrowSize;
      expect(Number.parseFloat(arrowSize)).assertEqual(18)
      expect(arrowSize.substr(arrowSize.length - 2, 2)).assertEqual("vp")
      expect(obj.$attrs.showBackground).assertEqual("false")
      expect(obj.$attrs.isSidebarMiddle).assertEqual("false")
      expect(obj.$attrs.arrowBackgroundColor).assertEqual("#00000000")
      expect(obj.$attrs.arrowColor).assertEqual(obj.$attrs.foregroundColor)
      expect(obj.$attrs.displayArrow).assertEqual("true")
      expect(obj.$attrs.hoverShow).assertEqual("false")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_NotSet_0200
     * @tc.number ArkUX_Stage_Swiper_NotSet_0200
     * @tc.desc   Tests the value of each attribute when ArrowStyle is true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_NotSet_0200', Level.LEVEL1, async () => {
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperE"))
      console.info('ArkUX_Stage_Swiper_NotSet_0200 showBackground :' + JSON.stringify(obj.$attrs.showBackground));
      console.info('ArkUX_Stage_Swiper_NotSet_0200 isSidebarMiddle :' + JSON.stringify(obj.$attrs.isSidebarMiddle));
      console.info('ArkUX_Stage_Swiper_NotSet_0200 backgroundSize :' + JSON.stringify(obj.$attrs.arrowBackgroundSize));
      console.info('ArkUX_Stage_Swiper_NotSet_0200 backgroundColor :' + JSON.stringify(obj.$attrs.arrowBackgroundColor));
      console.info('ArkUX_Stage_Swiper_NotSet_0200 arrowSize :' + JSON.stringify(obj.$attrs.arrowSize));
      console.info('ArkUX_Stage_Swiper_NotSet_0200 arrowColor :' + JSON.stringify(obj.$attrs.arrowColor));
      console.info('ArkUX_Stage_Swiper_NotSet_0200 displayArrow :' + JSON.stringify(obj.$attrs.displayArrow));
      console.info('ArkUX_Stage_Swiper_NotSet_0200 isHoverShow :' + JSON.stringify(obj.$attrs.hoverShow));
      let backgroundSize: ESObject = obj.$attrs.arrowBackgroundSize;
      expect(Number.parseFloat(backgroundSize)).assertEqual(24)
      expect(backgroundSize.substr(backgroundSize.length - 2, 2)).assertEqual("vp")
      let arrowSize: ESObject = obj.$attrs.arrowSize;
      expect(Number.parseFloat(arrowSize)).assertEqual(18)
      expect(arrowSize.substr(arrowSize.length - 2, 2)).assertEqual("vp")
      expect(obj.$attrs.showBackground).assertEqual("false")
      expect(obj.$attrs.isSidebarMiddle).assertEqual("false")
      expect(obj.$attrs.arrowBackgroundColor).assertEqual("#00000000")
      expect(obj.$attrs.arrowColor).assertEqual(obj.$attrs.foregroundColor)
      expect(obj.$attrs.displayArrow).assertEqual("true")
      expect(obj.$attrs.hoverShow).assertEqual("false")
    })

    /**
     * @tc.name   ArkUX_Stage_Swiper_NotSet_0300
     * @tc.number ArkUX_Stage_Swiper_NotSet_0300
     * @tc.desc   Tests the value of each property when displayArrow is not set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Swiper_NotSet_0300', Level.LEVEL1, async () => {
      let obj: ESObject = JSON.parse(getInspectorByKey("SwiperF"))
      console.info('ArkUX_Stage_Swiper_NotSet_0300 showBackground :' + JSON.stringify(obj.$attrs.showBackground));
      console.info('ArkUX_Stage_Swiper_NotSet_0300 isSidebarMiddle :' + JSON.stringify(obj.$attrs.isSidebarMiddle));
      console.info('ArkUX_Stage_Swiper_NotSet_0300 backgroundSize :' + JSON.stringify(obj.$attrs.arrowBackgroundSize));
      console.info('ArkUX_Stage_Swiper_NotSet_0300 backgroundColor :' + JSON.stringify(obj.$attrs.arrowBackgroundColor));
      console.info('ArkUX_Stage_Swiper_NotSet_0300 arrowSize :' + JSON.stringify(obj.$attrs.arrowSize));
      console.info('ArkUX_Stage_Swiper_NotSet_0300 arrowColor :' + JSON.stringify(obj.$attrs.arrowColor));
      console.info('ArkUX_Stage_Swiper_NotSet_0300 displayArrow :' + JSON.stringify(obj.$attrs.displayArrow));
      console.info('ArkUX_Stage_Swiper_NotSet_0300 isHoverShow :' + JSON.stringify(obj.$attrs.hoverShow));
      let backgroundSize: ESObject = obj.$attrs.arrowBackgroundSize;
      expect(Number.parseFloat(backgroundSize)).assertEqual(0)
      expect(backgroundSize.substr(backgroundSize.length - 2, 2)).assertEqual("vp")
      let arrowSize: ESObject = obj.$attrs.arrowSize;
      expect(Number.parseFloat(arrowSize)).assertEqual(0)
      expect(arrowSize.substr(arrowSize.length - 2, 2)).assertEqual("vp")
      expect(obj.$attrs.showBackground).assertEqual("false")
      expect(obj.$attrs.isSidebarMiddle).assertEqual("false")
      expect(obj.$attrs.arrowBackgroundColor).assertEqual("#00000000")
      expect(obj.$attrs.arrowColor).assertEqual("#00000000")
      expect(obj.$attrs.displayArrow).assertEqual("false")
      expect(obj.$attrs.hoverShow).assertEqual("false")
    })
  })
}