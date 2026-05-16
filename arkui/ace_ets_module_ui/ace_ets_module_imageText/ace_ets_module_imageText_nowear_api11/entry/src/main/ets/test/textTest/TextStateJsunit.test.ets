/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeEach, afterEach, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function TextStateJsunit() {
  describe('TextStateJsunit', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/text/TextState',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextState state pages:" + JSON.stringify(pages));
        if (!("TextState" == pages.name)) {
          console.info("get TextState state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextState page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextState page error:" + err);
      }

    });
    /**
     * @tc.name   ArkUX_Stage_Text_TextShadow_0100
     * @tc.number ArkUX_Stage_Text_TextShadow_0100
     * @tc.desc   ArkUX_Stage_Text_TextShadow_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Text_TextShadow_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Text_TextShadow_0100] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Text_TextShadow_0100');
          let obj: ESObject = JSON.parse(strJson);
          console.info("--->Text Shadow is :" + JSON.stringify(obj.$attrs.textShadow))
          expect(obj.$attrs.textShadow.radius).assertEqual("0.000000")
          expect(obj.$attrs.textShadow.color).assertEqual("#FF000000")
          expect(obj.$attrs.textShadow.offsetX).assertEqual("0.000000")
          expect(obj.$attrs.textShadow.offsetY).assertEqual("0.000000")
          done();
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_TextShadow_0100 ERROR: ' + JSON.stringify(err))
          done()
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Text_TextShadow_0200
     * @tc.number ArkUX_Stage_Text_TextShadow_0200
     * @tc.desc   ArkUX_Stage_Text_TextShadow_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Text_TextShadow_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Text_TextShadow_0200] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Text_TextShadow_0200');
          let obj: ESObject = JSON.parse(strJson);
          console.info("--->Text Shadow is:" + JSON.stringify(obj.$attrs.textShadow))
          expect(obj.$attrs.textShadow.radius).assertEqual("1.000000")
          expect(obj.$attrs.textShadow.color).assertEqual("#FF000000")
          expect(obj.$attrs.textShadow.offsetX).assertEqual("0.000000")
          expect(obj.$attrs.textShadow.offsetY).assertEqual("0.000000")
          done();
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_TextShadow_0200 ERROR: ' + JSON.stringify(err))
          done()
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Text_TextShadow_0300
     * @tc.number ArkUX_Stage_Text_TextShadow_0300
     * @tc.desc   ArkUX_Stage_Text_TextShadow_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Text_TextShadow_0300', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Text_TextShadow_0300] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Text_TextShadow_0300');
          let obj: ESObject = JSON.parse(strJson);
          console.info("--->Text Shadow " + JSON.stringify(obj.$attrs.textShadow))
          expect(obj.$attrs.textShadow.radius).assertEqual("0.000000")
          expect(obj.$attrs.textShadow.color).assertEqual("#FF000000")
          expect(obj.$attrs.textShadow.offsetX).assertEqual("0.000000")
          expect(obj.$attrs.textShadow.offsetY).assertEqual("0.000000")
          done();
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_TextShadow_0300 ERROR: ' + JSON.stringify(err))
          done()
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Text_TextShadow_0400
     * @tc.number ArkUX_Stage_Text_TextShadow_0400
     * @tc.desc   ArkUX_Stage_Text_TextShadow_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Text_TextShadow_0400', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Text_TextShadow_0400] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Text_TextShadow_0400');
          let obj: ESObject = JSON.parse(strJson);
          console.info("--->Text Shadow " + JSON.stringify(obj.$attrs.textShadow))
          expect(obj.$attrs.textShadow.radius).assertEqual("20.000000")
          expect(obj.$attrs.textShadow.color).assertEqual("#FF000000")
          expect(obj.$attrs.textShadow.offsetX).assertEqual("0.000000")
          expect(obj.$attrs.textShadow.offsetY).assertEqual("0.000000")
          done();
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_TextShadow_0400 ERROR: ' + JSON.stringify(err))
          done()
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Text_TextShadow_0500
     * @tc.number ArkUX_Stage_Text_TextShadow_0500
     * @tc.desc   ArkUX_Stage_Text_TextShadow_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Text_TextShadow_0500', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Text_TextShadow_0500] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Text_TextShadow_0500');
          let obj: ESObject = JSON.parse(strJson);
          console.info("--->Text Shadow " + JSON.stringify(obj.$attrs.textShadow))
          expect(obj.$attrs.textShadow.radius).assertEqual("5.000000")
          expect(obj.$attrs.textShadow.color).assertEqual("#FF000000")
          expect(obj.$attrs.textShadow.offsetX).assertEqual("0.000000")
          expect(obj.$attrs.textShadow.offsetY).assertEqual("0.000000")
          done();
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_TextShadow_0500 ERROR: ' + JSON.stringify(err))
          done()
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Text_TextShadow_0600
     * @tc.number ArkUX_Stage_Text_TextShadow_0600
     * @tc.desc   ArkUX_Stage_Text_TextShadow_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Text_TextShadow_0600', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Text_TextShadow_0600] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Text_TextShadow_0600');
          let obj: ESObject = JSON.parse(strJson);
          console.info("--->Text Shadow " + JSON.stringify(obj.$attrs.textShadow))
          expect(obj.$attrs.textShadow.radius).assertEqual("0.000000")
          expect(obj.$attrs.textShadow.color).assertEqual("#FF000000")
          expect(obj.$attrs.textShadow.offsetX).assertEqual("0.000000")
          expect(obj.$attrs.textShadow.offsetY).assertEqual("0.000000")
          done();
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_TextShadow_0600 ERROR: ' + JSON.stringify(err))
          done()
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Text_TextShadow_0700
     * @tc.number ArkUX_Stage_Text_TextShadow_0700
     * @tc.desc   ArkUX_Stage_Text_TextShadow_0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Text_TextShadow_0700', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Text_TextShadow_0700] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Text_TextShadow_0700');
          let obj: ESObject = JSON.parse(strJson);
          console.info("--->Text Shadow " + JSON.stringify(obj.$attrs.textShadow))
          expect(obj.$attrs.textShadow.radius).assertEqual("1.000000")
          expect(obj.$attrs.textShadow.color).assertEqual("#FF0000FF")
          expect(obj.$attrs.textShadow.offsetX).assertEqual("0.000000")
          expect(obj.$attrs.textShadow.offsetY).assertEqual("0.000000")
          done();
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_TextShadow_0700 ERROR: ' + JSON.stringify(err))
          done()
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Text_TextShadow_0800
     * @tc.number ArkUX_Stage_Text_TextShadow_0800
     * @tc.desc   ArkUX_Stage_Text_TextShadow_0800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Text_TextShadow_0800', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Text_TextShadow_0800] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Text_TextShadow_0800');
          let obj: ESObject = JSON.parse(strJson);
          console.info("--->Text Shadow " + JSON.stringify(obj.$attrs.textShadow))
          expect(obj.$attrs.textShadow.radius).assertEqual("1.000000")
          expect(obj.$attrs.textShadow.color).assertEqual("#FFFF0000")
          expect(obj.$attrs.textShadow.offsetX).assertEqual("0.000000")
          expect(obj.$attrs.textShadow.offsetY).assertEqual("0.000000")
          done();
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_TextShadow_0800 ERROR: ' + JSON.stringify(err))
          done()
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Text_TextShadow_0900
     * @tc.number ArkUX_Stage_Text_TextShadow_0900
     * @tc.desc   ArkUX_Stage_Text_TextShadow_0900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Text_TextShadow_0900', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Text_TextShadow_0900] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Text_TextShadow_0900');
          let obj: ESObject = JSON.parse(strJson);
          console.info("--->Text Shadow " + JSON.stringify(obj.$attrs.textShadow))
          expect(obj.$attrs.textShadow.radius).assertEqual("1.000000")
          expect(obj.$attrs.textShadow.color).assertEqual("#FFFF0000")
          expect(obj.$attrs.textShadow.offsetX).assertEqual("0.000000")
          expect(obj.$attrs.textShadow.offsetY).assertEqual("0.000000")
          done();
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_TextShadow_0900 ERROR: ' + JSON.stringify(err))
          done()
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Text_TextShadow_1000
     * @tc.number ArkUX_Stage_Text_TextShadow_1000
     * @tc.desc   ArkUX_Stage_Text_TextShadow_1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Text_TextShadow_1000', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Text_TextShadow_1000] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Text_TextShadow_1000');
          let obj: ESObject = JSON.parse(strJson);
          console.info("--->Text Shadow " + JSON.stringify(obj.$attrs.textShadow))
          expect(obj.$attrs.textShadow.radius).assertEqual("1.000000")
          expect(obj.$attrs.textShadow.color).assertEqual("#FFFD0000")
          expect(obj.$attrs.textShadow.offsetX).assertEqual("0.000000")
          expect(obj.$attrs.textShadow.offsetY).assertEqual("0.000000")
          done();
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_TextShadow_1000 ERROR: ' + JSON.stringify(err))
          done()
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Text_TextShadow_1100
     * @tc.number ArkUX_Stage_Text_TextShadow_1100
     * @tc.desc   ArkUX_Stage_Text_TextShadow_1100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Text_TextShadow_1100', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Text_TextShadow_1100] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Text_TextShadow_1100');
          let obj: ESObject = JSON.parse(strJson);
          console.info("--->Text Shadow " + JSON.stringify(obj.$attrs.textShadow))
          expect(obj.$attrs.textShadow.radius).assertEqual("1.000000")
          expect(obj.$attrs.textShadow.color).assertEqual("#FF000000")
          expect(obj.$attrs.textShadow.offsetX).assertEqual("0.000000")
          expect(obj.$attrs.textShadow.offsetY).assertEqual("0.000000")
          done();
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_TextShadow_1100 ERROR: ' + JSON.stringify(err))
          done()
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Text_TextShadow_1200
     * @tc.number ArkUX_Stage_Text_TextShadow_1200
     * @tc.desc   ArkUX_Stage_Text_TextShadow_1200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Text_TextShadow_1200', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Text_TextShadow_1200] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Text_TextShadow_1200');
          let obj: ESObject = JSON.parse(strJson);
          console.info("--->Text Shadow " + JSON.stringify(obj.$attrs.textShadow))
          expect(obj.$attrs.textShadow.radius).assertEqual("1.000000")
          expect(obj.$attrs.textShadow.color).assertEqual("#FF000000")
          expect(obj.$attrs.textShadow.offsetX).assertEqual("5.000000")
          expect(obj.$attrs.textShadow.offsetY).assertEqual("0.000000")
          done();
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_TextShadow_1200 ERROR: ' + JSON.stringify(err))
          done()
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Text_TextShadow_1300
     * @tc.number ArkUX_Stage_Text_TextShadow_1300
     * @tc.desc   ArkUX_Stage_Text_TextShadow_1300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Text_TextShadow_1300', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Text_TextShadow_1300] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Text_TextShadow_1300');
          let obj: ESObject = JSON.parse(strJson);
          console.info("--->Text Shadow " + JSON.stringify(obj.$attrs.textShadow))
          expect(obj.$attrs.textShadow.radius).assertEqual("1.000000")
          expect(obj.$attrs.textShadow.color).assertEqual("#FF000000")
          expect(obj.$attrs.textShadow.offsetX).assertEqual("-5.000000")
          expect(obj.$attrs.textShadow.offsetY).assertEqual("0.000000")
          done();
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_TextShadow_1300 ERROR: ' + JSON.stringify(err))
          done()
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Text_TextShadow_1400
     * @tc.number ArkUX_Stage_Text_TextShadow_1400
     * @tc.desc   ArkUX_Stage_Text_TextShadow_1400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Text_TextShadow_1400', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Text_TextShadow_1400] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Text_TextShadow_1400');
          let obj: ESObject = JSON.parse(strJson);
          console.info("--->Text Shadow " + JSON.stringify(obj.$attrs.textShadow))
          expect(obj.$attrs.textShadow.radius).assertEqual("1.000000")
          expect(obj.$attrs.textShadow.color).assertEqual("#FF000000")
          expect(obj.$attrs.textShadow.offsetX).assertEqual("0.000000")
          expect(obj.$attrs.textShadow.offsetY).assertEqual("5.000000")
          done();
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_TextShadow_1400 ERROR: ' + JSON.stringify(err))
          done()
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Text_TextShadow_1500
     * @tc.number ArkUX_Stage_Text_TextShadow_1500
     * @tc.desc   ArkUX_Stage_Text_TextShadow_1500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Text_TextShadow_1500', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Text_TextShadow_0100] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Text_TextShadow_1500');
          let obj: ESObject = JSON.parse(strJson);
          console.info("--->Text Shadow " + JSON.stringify(obj.$attrs.textShadow))
          expect(obj.$attrs.textShadow.radius).assertEqual("1.000000")
          expect(obj.$attrs.textShadow.color).assertEqual("#FF000000")
          expect(obj.$attrs.textShadow.offsetX).assertEqual("0.000000")
          expect(obj.$attrs.textShadow.offsetY).assertEqual("-5.000000")
          done();
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_TextShadow_1500 ERROR: ' + JSON.stringify(err))
          done()
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Text_TextShadow_1600
     * @tc.number ArkUX_Stage_Text_TextShadow_1500
     * @tc.desc   ArkUX_Stage_Text_TextShadow_1600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Text_TextShadow_1600', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Text_TextShadow_1600] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Text_TextShadow_1600');
          let obj: ESObject = JSON.parse(strJson);
          console.info("--->Text Shadow " + JSON.stringify(obj.$attrs.textShadow))
          expect(obj.$attrs.textShadow.radius).assertEqual("1.000000")
          expect(obj.$attrs.textShadow.color).assertEqual("#FF000000")
          expect(obj.$attrs.textShadow.offsetX).assertEqual("5.000000")
          expect(obj.$attrs.textShadow.offsetY).assertEqual("5.000000")
          done();
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_TextShadow_1600 ERROR: ' + JSON.stringify(err))
          done()
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Text_TextShadow_1700
     * @tc.number ArkUX_Stage_Text_TextShadow_1700
     * @tc.desc   ArkUX_Stage_Text_TextShadow_1700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Text_TextShadow_1700', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Text_TextShadow_1700] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Text_TextShadow_1700');
          let obj: ESObject = JSON.parse(strJson);
          console.info("--->Text Shadow " + JSON.stringify(obj.$attrs.textShadow))
          expect(obj.$attrs.textShadow.radius).assertEqual("1.000000")
          expect(obj.$attrs.textShadow.color).assertEqual("#FF000000")
          expect(obj.$attrs.textShadow.offsetX).assertEqual("5.000000")
          expect(obj.$attrs.textShadow.offsetY).assertEqual("-5.000000")
          done();
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_TextShadow_1700 ERROR: ' + JSON.stringify(err))
          done()
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Text_TextShadow_1800
     * @tc.number ArkUX_Stage_Text_TextShadow_1800
     * @tc.desc   ArkUX_Stage_Text_TextShadow_1800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Text_TextShadow_1800', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Text_TextShadow_1800] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Text_TextShadow_1800');
          let obj: ESObject = JSON.parse(strJson);
          console.info("--->Text Shadow " + JSON.stringify(obj.$attrs.textShadow))
          expect(obj.$attrs.textShadow.radius).assertEqual("1.000000")
          expect(obj.$attrs.textShadow.color).assertEqual("#FF000000")
          expect(obj.$attrs.textShadow.offsetX).assertEqual("-5.000000")
          expect(obj.$attrs.textShadow.offsetY).assertEqual("5.000000")
          done();
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_TextShadow_1800 ERROR: ' + JSON.stringify(err))
        }
        done();
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Text_TextShadow_1900
     * @tc.number ArkUX_Stage_Text_TextShadow_1900
     * @tc.desc   ArkUX_Stage_Text_TextShadow_1900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Text_TextShadow_1900', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Text_TextShadow_1900] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Text_TextShadow_1900');
          let obj: ESObject = JSON.parse(strJson);
          console.info("--->Text Shadow " + JSON.stringify(obj.$attrs.textShadow))
          expect(obj.$attrs.textShadow.radius).assertEqual("1.000000")
          expect(obj.$attrs.textShadow.color).assertEqual("#FF000000")
          expect(obj.$attrs.textShadow.offsetX).assertEqual("-5.000000")
          expect(obj.$attrs.textShadow.offsetY).assertEqual("-5.000000")
          done();
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_TextShadow_1900 ERROR: ' + JSON.stringify(err))
        }
        done();
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Text_TextShadow_2000
     * @tc.number ArkUX_Stage_Text_TextShadow_2000
     * @tc.desc   ArkUX_Stage_Text_TextShadow_2000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Text_TextShadow_2000', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Text_TextShadow_0100] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Text_TextShadow_2000');
          let obj: ESObject = JSON.parse(strJson);
          console.info("--->Text Shadow " + JSON.stringify(obj.$attrs.textShadow))
          expect(obj.$attrs.textShadow.radius).assertEqual("1.000000")
          expect(obj.$attrs.textShadow.color).assertEqual("#FF0000FF")
          expect(obj.$attrs.textShadow.offsetX).assertEqual("5.000000")
          expect(obj.$attrs.textShadow.offsetY).assertEqual("-5.000000")
          done();
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_TextShadow_2000 ERROR: ' + JSON.stringify(err))
          done()
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Text_TextShadow_2100
     * @tc.number ArkUX_Stage_Text_TextShadow_2100
     * @tc.desc   ArkUX_Stage_Text_TextShadow_2100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Text_TextShadow_2100', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Text_TextShadow_0100] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Text_TextShadow_2100');
          let obj: ESObject = JSON.parse(strJson);
          console.info("--->Text Shadow " + JSON.stringify(obj.$attrs.textShadow))
          expect(JSON.stringify(obj.$attrs.textShadow)).assertEqual("[]")
          done()
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_TextShadow_2000 ERROR: ' + JSON.stringify(err))
        }
        done();
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Text_TextShadow_2200
     * @tc.number ArkUX_Stage_Text_TextShadow_2200
     * @tc.desc   ArkUX_Stage_Text_TextShadow_2200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Text_TextShadow_2200', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Text_TextShadow_2200] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Text_TextShadow_2200');
          let obj: ESObject = JSON.parse(strJson);
          console.info("--->Text Shadow " + JSON.stringify(obj.$attrs.textShadow))
          expect(obj.$attrs.textShadow.radius).assertEqual("1.000000")
          expect(obj.$attrs.textShadow.color).assertEqual("#FFFF0000")
          expect(obj.$attrs.textShadow.offsetX).assertEqual("5.000000")
          expect(obj.$attrs.textShadow.offsetY).assertEqual("5.000000")
          done()
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_TextShadow_2200 ERROR: ' + JSON.stringify(err))
        }
        done();
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Text_TextShadow_2300
     * @tc.number ArkUX_Stage_Text_TextShadow_2300
     * @tc.desc   ArkUX_Stage_Text_TextShadow_2300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Text_TextShadow_2300', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Text_TextShadow_2300] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Text_TextShadow_2300');
          let obj: ESObject = JSON.parse(strJson);
          console.info("--->Text Shadow " + JSON.stringify(obj.$attrs.textShadow))
          expect(obj.$attrs.textShadow.radius).assertEqual("1.000000")
          expect(obj.$attrs.textShadow.color).assertEqual("#FFFF0000")
          expect(obj.$attrs.textShadow.offsetX).assertEqual("0.000000")
          expect(obj.$attrs.textShadow.offsetY).assertEqual("0.000000")
          done();
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_TextShadow_2300 ERROR: ' + JSON.stringify(err))
          done()
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Text_TextShadow_2400
     * @tc.number ArkUX_Stage_Text_TextShadow_2400
     * @tc.desc   ArkUX_Stage_Text_TextShadow_2400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Text_TextShadow_2400', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Text_TextShadow_2400] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Text_TextShadow_2400');
          let obj: ESObject = JSON.parse(strJson);
          console.info("--->Text Shadow " + JSON.stringify(obj.$attrs.textShadow))
          expect(obj.$attrs.textShadow.radius).assertEqual("1.000000")
          expect(obj.$attrs.textShadow.color).assertEqual("#FF000000")
          expect(obj.$attrs.textShadow.offsetX).assertEqual("0.000000")
          expect(obj.$attrs.textShadow.offsetY).assertEqual("0.000000")
          done();
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_TextShadow_2400 ERROR: ' + JSON.stringify(err))
          done()
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Text_TextShadow_2500
     * @tc.number ArkUX_Stage_Text_TextShadow_2500
     * @tc.desc   ArkUX_Stage_Text_TextShadow_2500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Text_TextShadow_2500', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Text_TextShadow_2500] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Text_TextShadow_2500');
          let obj: ESObject = JSON.parse(strJson);
          console.info("--->Text Shadow " + JSON.stringify(obj.$attrs.textShadow))
          expect(obj.$attrs.textShadow[0].radius).assertEqual("10.000000")
          expect(obj.$attrs.textShadow[0].color).assertEqual("#FF000000")
          expect(obj.$attrs.textShadow[0].offsetX).assertEqual("-10.000000")
          expect(obj.$attrs.textShadow[0].offsetY).assertEqual("-10.000000")
          expect(obj.$attrs.textShadow[1].radius).assertEqual("10.000000")
          expect(obj.$attrs.textShadow[1].color).assertEqual("#FFFF0000")
          expect(obj.$attrs.textShadow[1].offsetX).assertEqual("10.000000")
          expect(obj.$attrs.textShadow[1].offsetY).assertEqual("10.000000")
          done();
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_TextShadow_2500 ERROR: ' + JSON.stringify(err))
          done()
        }
      }, 500)
    })


    /**
     * @tc.name   ArkUX_Stage_Text_TextOverflow_0100
     * @tc.number ArkUX_Stage_Text_TextOverflow_0100
     * @tc.desc   ArkUX_Stage_Text_TextOverflow_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Text_TextOverflow_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Text_TextOverflow_0100] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Text_TextOverflow_0100');
          let obj: ESObject = JSON.parse(strJson);
          console.info("--->text Overflow is " + JSON.stringify(obj.$attrs.textOverflow))
          expect(obj.$attrs.textOverflow).assertEqual("TextOverflow.Clip")
          done()
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_TextOverflow_0100 ERROR: ' + JSON.stringify(err))
          done()
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Text_TextOverflow_0200
     * @tc.number ArkUX_Stage_Text_TextOverflow_0200
     * @tc.desc   ArkUX_Stage_Text_TextOverflow_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Text_TextOverflow_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Text_TextOverflow_0200] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Text_TextOverflow_0200');
          let obj: ESObject = JSON.parse(strJson);
          console.info("--->text Overflow is " + JSON.stringify(obj.$attrs.textOverflow))
          expect(obj.$attrs.textOverflow).assertEqual("TextOverflow.Clip")
          done()
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_TextOverflow_0200 ERROR: ' + JSON.stringify(err))
          done()
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Text_TextOverflow_0300
     * @tc.number ArkUX_Stage_Text_TextOverflow_0300
     * @tc.desc   ArkUX_Stage_Text_TextOverflow_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Text_TextOverflow_0300', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Text_TextOverflow_0300] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Text_TextOverflow_0300');
          let obj: ESObject = JSON.parse(strJson);
          console.info("--->text Overflow is " + JSON.stringify(obj.$attrs.textOverflow))
          expect(obj.$attrs.textOverflow).assertEqual("TextOverflow.Clip")
          done()
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_TextOverflow_0300 ERROR: ' + JSON.stringify(err))
          done()
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Text_TextOverflow_0400
     * @tc.number ArkUX_Stage_Text_TextOverflow_0400
     * @tc.desc   ArkUX_Stage_Text_TextOverflow_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Text_TextOverflow_0400', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Text_TextOverflow_0400] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Text_TextOverflow_0400');
          let obj: ESObject = JSON.parse(strJson);
          console.info("--->text Overflow is " + JSON.stringify(obj.$attrs.textOverflow))
          expect(obj.$attrs.textOverflow).assertEqual("TextOverflow.Ellipsis")
          done()
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_TextOverflow_0400 ERROR: ' + JSON.stringify(err))
          done()
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Text_TextOverflow_0500
     * @tc.number ArkUX_Stage_Text_TextOverflow_0500
     * @tc.desc   ArkUX_Stage_Text_TextOverflow_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Text_TextOverflow_0500', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Text_TextOverflow_0500] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Text_TextOverflow_0500');
          let obj: ESObject = JSON.parse(strJson);
          console.info("--->text Overflow is " + JSON.stringify(obj.$attrs.textOverflow))
          expect(obj.$attrs.textOverflow).assertEqual("TextOverflow.Ellipsis")
          done()
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_TextOverflow_0500 ERROR: ' + JSON.stringify(err))
          done()
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Text_TextOverflow_0600
     * @tc.number ArkUX_Stage_Text_TextOverflow_0600
     * @tc.desc   ArkUX_Stage_Text_TextOverflow_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Text_TextOverflow_0600', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Text_TextOverflow_0600] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Text_TextOverflow_0600');
          let obj: ESObject = JSON.parse(strJson);
          console.info("--->text Overflow is " + JSON.stringify(obj.$attrs.textOverflow))
          expect(obj.$attrs.textOverflow).assertEqual("TextOverflow.None")
          done()
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_TextOverflow_0600 ERROR: ' + JSON.stringify(err))
          done()
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Text_TextOverflow_0700
     * @tc.number ArkUX_Stage_Text_TextOverflow_0700
     * @tc.desc   ArkUX_Stage_Text_TextOverflow_0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Text_TextOverflow_0700', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Text_TextOverflow_0700] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Text_TextOverflow_0700');
          let obj: ESObject = JSON.parse(strJson);
          console.info("--->text Overflow is " + JSON.stringify(obj.$attrs.textOverflow))
          expect(obj.$attrs.textOverflow).assertEqual("TextOverflow.Marquee")
          done()
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_TextOverflow_0700 ERROR: ' + JSON.stringify(err))
          done()
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Text_TextOverflow_0800
     * @tc.number ArkUX_Stage_Text_TextOverflow_0800
     * @tc.desc   ArkUX_Stage_Text_TextOverflow_0800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Text_TextOverflow_0800', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Text_TextOverflow_0800] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Text_TextOverflow_0800');
          let obj: ESObject = JSON.parse(strJson);
          console.info("--->text Overflow is " + JSON.stringify(obj.$attrs.textOverflow))
          expect(obj.$attrs.textOverflow).assertEqual("TextOverflow.Clip")
          done()
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_TextOverflow_0800 ERROR: ' + JSON.stringify(err))
          done()
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Text_TextOverflow_0900
     * @tc.number ArkUX_Stage_Text_TextOverflow_0800
     * @tc.desc   ArkUX_Stage_Text_TextOverflow_0900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Text_TextOverflow_0900', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Text_TextOverflow_0900] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Text_TextOverflow_0900');
          let obj: ESObject = JSON.parse(strJson);
          console.info("--->text Overflow is " + JSON.stringify(obj.$attrs.textOverflow))
          expect(obj.$attrs.textOverflow).assertEqual("TextOverflow.Clip")
          console.info("--->fontSize is :" + JSON.stringify(obj.$attrs.fontSize))
          expect(obj.$attrs.fontSize).assertEqual("15.00fp")
          done()
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_TextOverflow_0900 ERROR: ' + JSON.stringify(err))
          done()
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Text_TextAlign_0100
     * @tc.number ArkUX_Stage_Text_TextAlign_0100
     * @tc.desc   ArkUX_Stage_Text_TextAlign_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Text_TextAlign_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Text_TextAlign_0100] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Text_TextAlign_0100');
          let obj: ESObject = JSON.parse(strJson);
          console.info("--->textAlign is: " + JSON.stringify(obj.$attrs.textAlign))
          expect(obj.$attrs.textAlign).assertEqual("TextAlign.Start")
          done()
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_TextAlign_0100 ERROR: ' + JSON.stringify(err))
          done()
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Text_TextAlign_0200
     * @tc.number ArkUX_Stage_Text_TextAlign_0200
     * @tc.desc   ArkUX_Stage_Text_TextAlign_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Text_TextAlign_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Text_TextAlign_0100] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Text_TextAlign_0200');
          let obj: ESObject = JSON.parse(strJson);
          console.info("--->textAlign is: " + JSON.stringify(obj.$attrs.textAlign))
          expect(obj.$attrs.textAlign).assertEqual("TextAlign.Start")
          done()
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_TextAlign_0200 ERROR: ' + JSON.stringify(err))
          done()
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Text_TextAlign_0300
     * @tc.number ArkUX_Stage_Text_TextAlign_0300
     * @tc.desc   ArkUX_Stage_Text_TextAlign_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Text_TextAlign_0300', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Text_TextAlign_0300] START');
      setTimeout(() => {
        try {

          let strJson = getInspectorByKey('ArkUX_Stage_Text_TextAlign_0300');
          let obj: ESObject = JSON.parse(strJson);
          console.info("--->textAlign is: " + JSON.stringify(obj.$attrs.textAlign))
          expect(obj.$attrs.textAlign).assertEqual("TextAlign.Center")
          done()
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_TextAlign_0300 ERROR: ' + JSON.stringify(err))
          done()
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Text_TextAlign_0400
     * @tc.number ArkUX_Stage_Text_TextAlign_0400
     * @tc.desc   ArkUX_Stage_Text_TextAlign_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Text_TextAlign_0400', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Text_TextAlign_0400] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Text_TextAlign_0400');
          let obj: ESObject = JSON.parse(strJson);
          console.info("--->textAlign is: " + JSON.stringify(obj.$attrs.textAlign))
          expect(obj.$attrs.textAlign).assertEqual("TextAlign.End")
          done()
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_TextAlign_0400 ERROR: ' + JSON.stringify(err))
          done()
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Text_TextAlign_0500
     * @tc.number ArkUX_Stage_Text_TextAlign_0500
     * @tc.desc   ArkUX_Stage_Text_TextAlign_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Text_TextAlign_0500', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Text_TextAlign_0500] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Text_TextAlign_0500');
          let obj: ESObject = JSON.parse(strJson);
          console.info("--->textAlign is: " + JSON.stringify(obj.$attrs.textAlign))
          expect(obj.$attrs.textAlign).assertEqual("TextAlign.Justify")
          done()
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_TextAlign_0500 ERROR: ' + JSON.stringify(err))
          done()
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Text_TextAlign_0600
     * @tc.number ArkUX_Stage_Text_TextAlign_0600
     * @tc.desc   ArkUX_Stage_Text_TextAlign_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Text_TextAlign_0600', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Text_TextAlign_0600] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Text_TextAlign_0600');
          let obj: ESObject = JSON.parse(strJson);
          console.info("--->textAlign is: " + JSON.stringify(obj.$attrs.textAlign))
          expect(obj.$attrs.textAlign).assertEqual("TextAlign.Start")
          done()
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_TextAlign_0600 ERROR: ' + JSON.stringify(err))
          done()
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Text_TextAlign_0700
     * @tc.number ArkUX_Stage_Text_TextAlign_0700
     * @tc.desc   ArkUX_Stage_Text_TextAlign_0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Text_TextAlign_0700', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Text_TextAlign_0700] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Text_TextAlign_0700');
          let obj: ESObject = JSON.parse(strJson);
          expect(obj.$attrs.textAlign).assertEqual("TextAlign.End")
          console.info("--->textAlign is: " + JSON.stringify(obj.$attrs.textAlign))
          expect(obj.$attrs.textOverflow).assertEqual("TextOverflow.Clip")
          console.info("--->textOverflow is: " + JSON.stringify(obj.$attrs.textAlign))
          done()
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_TextAlign_0700 ERROR: ' + JSON.stringify(err))
          done()
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Text_heightAdaptivePolicy_0100
     * @tc.number ArkUX_Stage_Text_heightAdaptivePolicy_0100
     * @tc.desc   ArkUX_Stage_Text_heightAdaptivePolicy_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Text_heightAdaptivePolicy_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Text_heightAdaptivePolicy_0100] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Text_heightAdaptivePolicy_0100');
          let obj: ESObject = JSON.parse(strJson);
          console.info("--->Text heightAdaptivePolicy is: " +
          JSON.stringify(obj.$attrs.heightAdaptivePolicy))
          expect(obj.$attrs.heightAdaptivePolicy)
            .assertEqual("TextHeightAdaptivePolicy.MIN_FONT_SIZE_FIRST")
          done()
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_heightAdaptivePolicy_0100 ERROR: ' + JSON.stringify(err))
          done()
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Text_heightAdaptivePolicy_0200
     * @tc.number ArkUX_Stage_Text_heightAdaptivePolicy_0200
     * @tc.desc   ArkUX_Stage_Text_heightAdaptivePolicy_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Text_heightAdaptivePolicy_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Text_heightAdaptivePolicy_0200] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Text_heightAdaptivePolicy_0200');
          let obj: ESObject = JSON.parse(strJson);
          console.info("--->Text heightAdaptivePolicy is: " +
          JSON.stringify(obj.$attrs.heightAdaptivePolicy))
          console.info("--->Text heightAdaptivePolicy is: "
            + JSON.stringify(obj.$attrs.heightAdaptivePolicy))
          expect(obj.$attrs.heightAdaptivePolicy)
            .assertEqual("TextHeightAdaptivePolicy.MAX_LINES_FIRST")
          done()
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_heightAdaptivePolicy_0200 ERROR: ' + JSON.stringify(err))
          done()
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Text_heightAdaptivePolicy_0300
     * @tc.number ArkUX_Stage_Text_heightAdaptivePolicy_0300
     * @tc.desc   ArkUX_Stage_Text_heightAdaptivePolicy_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Text_heightAdaptivePolicy_0300', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Text_heightAdaptivePolicy_0300] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Text_heightAdaptivePolicy_0300');
          let obj: ESObject = JSON.parse(strJson);
          console.info("--->Text heightAdaptivePolicy is: " +
          JSON.stringify(obj.$attrs.heightAdaptivePolicy))
          expect(obj.$attrs.heightAdaptivePolicy)
            .assertEqual("TextHeightAdaptivePolicy.LAYOUT_CONSTRAINT_FIRST")
          done()
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_heightAdaptivePolicy_0300 ERROR: ' + JSON.stringify(err))
          done()
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Text_heightAdaptivePolicy_0400
     * @tc.number ArkUX_Stage_Text_heightAdaptivePolicy_0400
     * @tc.desc   ArkUX_Stage_Text_heightAdaptivePolicy_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Text_heightAdaptivePolicy_0400', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Text_heightAdaptivePolicy_0400] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Text_heightAdaptivePolicy_0400');
          let obj: ESObject = JSON.parse(strJson);
          console.info("--->Text heightAdaptivePolicy is: " +
          JSON.stringify(obj.$attrs.heightAdaptivePolicy))
          expect(obj.$attrs.heightAdaptivePolicy)
            .assertEqual("TextHeightAdaptivePolicy.MAX_LINES_FIRST")
          done()
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_heightAdaptivePolicy_0400 ERROR: ' + JSON.stringify(err))
          done()
        }
      }, 500)
    })

    /**
     * @tc.name   ArkUX_Stage_Text_heightAdaptivePolicy_0500
     * @tc.number ArkUX_Stage_Text_heightAdaptivePolicy_0500
     * @tc.desc   ArkUX_Stage_Text_heightAdaptivePolicy_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Text_heightAdaptivePolicy_0500', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUX_Stage_Text_heightAdaptivePolicy_0500] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Text_heightAdaptivePolicy_0500');
          let obj: ESObject = JSON.parse(strJson);
          console.info("--->Text heightAdaptivePolicy is: " +
          JSON.stringify(obj.$attrs.heightAdaptivePolicy))
          expect(obj.$attrs.heightAdaptivePolicy)
            .assertEqual("TextHeightAdaptivePolicy.MIN_FONT_SIZE_FIRST")
          done()
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_heightAdaptivePolicy_0500 ERROR: ' + JSON.stringify(err))
          done()
        }
      }, 500)
    })
  })
}
