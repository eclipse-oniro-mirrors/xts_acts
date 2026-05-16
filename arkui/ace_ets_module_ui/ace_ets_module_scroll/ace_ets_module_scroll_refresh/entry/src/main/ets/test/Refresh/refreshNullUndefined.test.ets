/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function refreshNullUndefined() {
  describe('refreshNullUndefined', () => {
    beforeEach(async (done: Function) => {
      console.info("refreshNullUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Refresh/refreshNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get refreshNullUndefined state success " + JSON.stringify(pages));
        if (!("refreshNullUndefined" == pages.name)) {
          console.info("get refreshNullUndefined state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push refreshNullUndefined page success " + JSON.stringify(result));
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push refreshNullUndefined page error: " + err);
      }
      done()
    });

    // ========== refreshOffset tests ==========
    /**
     * @tc.name   refreshOffsetNullUndefined_0100
     * @tc.number refreshOffsetNullUndefined_0100
     * @tc.desc   Test Refresh refreshOffset property with no set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('refreshOffsetNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[refreshOffsetNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('refresh_refreshOffset_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[refreshOffsetNullUndefined_0100] type: " + JSON.stringify(obj.$type));
      console.info("[refreshOffsetNullUndefined_0100] no set obj is: " + JSON.stringify(obj.$attrs.refreshOffset));

      // Refresh refreshOffset 不设置
      expect(obj.$attrs.refreshOffset).assertEqual("0.00vp");
      console.info('[refreshOffsetNullUndefined_0100] END');
    })

    /**
     * @tc.name   refreshOffsetNullUndefined_0200
     * @tc.number refreshOffsetNullUndefined_0200
     * @tc.desc   Test Refresh refreshOffset property with null and undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('refreshOffsetNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[refreshOffsetNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('refresh_refreshOffset_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let strJsonUn: string = getInspectorByKey('refresh_refreshOffset_undefined');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonUn);

      console.info("[refreshOffsetNullUndefined_0200] type: " + JSON.stringify(obj.$type));
      console.info("[refreshOffsetNullUndefined_0200] null obj is: " + JSON.stringify(obj.$attrs.refreshOffset));
      console.info("[refreshOffsetNullUndefined_0200] undefined obj is: " + JSON.stringify(objCompare.$attrs.refreshOffset));

      // Refresh refreshOffset 设置null，设置undefined
      expect(obj.$attrs.refreshOffset).assertEqual(objCompare.$attrs.refreshOffset);
      console.info('[refreshOffsetNullUndefined_0200] END');
    })

    // ========== pullToRefresh tests ==========
    /**
     * @tc.name   pullToRefreshNullUndefined_0100
     * @tc.number pullToRefreshNullUndefined_0100
     * @tc.desc   Test Refresh pullToRefresh property with false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('pullToRefreshNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[pullToRefreshNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('refresh_pullToRefresh_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[pullToRefreshNullUndefined_0100] type: " + JSON.stringify(obj.$type));
      console.info("[pullToRefreshNullUndefined_0100] false is: " + JSON.stringify(obj.$attrs.pullToRefresh));

      // Refresh pullToRefresh 设置false
      expect(obj.$attrs.pullToRefresh).assertEqual(false);
      console.info('[pullToRefreshNullUndefined_0100] END');
    })

    /**
     * @tc.name   pullToRefreshNullUndefined_0200
     * @tc.number pullToRefreshNullUndefined_0200
     * @tc.desc   Test Refresh pullToRefresh property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('pullToRefreshNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[pullToRefreshNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('refresh_pullToRefresh_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[pullToRefreshNullUndefined_0200] type: " + JSON.stringify(obj.$type));
      console.info("[pullToRefreshNullUndefined_0200] null obj is: " + JSON.stringify(obj.$attrs.pullToRefresh));

      // Refresh pullToRefresh 设置null
      expect(obj.$attrs.pullToRefresh).assertEqual(true);
      console.info('[pullToRefreshNullUndefined_0200] END');
    })

    /**
     * @tc.name   pullToRefreshNullUndefined_0300
     * @tc.number pullToRefreshNullUndefined_0300
     * @tc.desc   Test Refresh pullToRefresh property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('pullToRefreshNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[pullToRefreshNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('refresh_pullToRefresh_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[pullToRefreshNullUndefined_0300] type: " + JSON.stringify(obj.$type));
      console.info("[pullToRefreshNullUndefined_0300] undefined obj is: " + JSON.stringify(obj.$attrs.pullToRefresh));

      // Refresh pullToRefresh 设置undefined
      expect(obj.$attrs.pullToRefresh).assertEqual(true);
      console.info('[pullToRefreshNullUndefined_0300] END');
    })

    // ========== pullUpToCancelRefresh tests ==========
    /**
     * @tc.name   pullUpToCancelRefreshNullUndefined_0100
     * @tc.number pullUpToCancelRefreshNullUndefined_0100
     * @tc.desc   Test Refresh pullUpToCancelRefresh property with true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('pullUpToCancelRefreshNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[pullUpToCancelRefreshNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('refresh_pullUpToCancelRefresh_true');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[pullUpToCancelRefreshNullUndefined_0100] type: " + JSON.stringify(obj.$type));
      console.info("[pullUpToCancelRefreshNullUndefined_0100] true is: " + JSON.stringify(obj.$attrs.pullUpToCancelRefresh));

      // Refresh pullUpToCancelRefresh 设置true
      expect(obj.$attrs.pullUpToCancelRefresh).assertEqual(true);
      console.info('[pullUpToCancelRefreshNullUndefined_0100] END');
    })

    /**
     * @tc.name   pullUpToCancelRefreshNullUndefined_0200
     * @tc.number pullUpToCancelRefreshNullUndefined_0200
     * @tc.desc   Test Refresh pullUpToCancelRefresh property with false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('pullUpToCancelRefreshNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[pullUpToCancelRefreshNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('refresh_pullUpToCancelRefresh_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[pullUpToCancelRefreshNullUndefined_0200] type: " + JSON.stringify(obj.$type));
      console.info("[pullUpToCancelRefreshNullUndefined_0200] false is: " + JSON.stringify(obj.$attrs.pullUpToCancelRefresh));

      // Refresh pullUpToCancelRefresh 设置false
      expect(obj.$attrs.pullUpToCancelRefresh).assertEqual(false);
      console.info('[pullUpToCancelRefreshNullUndefined_0200] END');
    })

    /**
     * @tc.name   pullUpToCancelRefreshNullUndefined_0300
     * @tc.number pullUpToCancelRefreshNullUndefined_0300
     * @tc.desc   Test Refresh pullUpToCancelRefresh property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('pullUpToCancelRefreshNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[pullUpToCancelRefreshNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('refresh_pullUpToCancelRefresh_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[pullUpToCancelRefreshNullUndefined_0300] type: " + JSON.stringify(obj.$type));
      console.info("[pullUpToCancelRefreshNullUndefined_0300] null obj is: " + JSON.stringify(obj.$attrs.pullUpToCancelRefresh));

      // Refresh pullUpToCancelRefresh 设置null
      expect(obj.$attrs.pullUpToCancelRefresh).assertEqual(true);
      console.info('[pullUpToCancelRefreshNullUndefined_0300] END');
    })

    /**
     * @tc.name   pullUpToCancelRefreshNullUndefined_0400
     * @tc.number pullUpToCancelRefreshNullUndefined_0400
     * @tc.desc   Test Refresh pullUpToCancelRefresh property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('pullUpToCancelRefreshNullUndefined_0400', Level.LEVEL0, async () => {
      console.info('[pullUpToCancelRefreshNullUndefined_0400] START');
      let strJson: string = getInspectorByKey('refresh_pullUpToCancelRefresh_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[pullUpToCancelRefreshNullUndefined_0400] type: " + JSON.stringify(obj.$type));
      console.info("[pullUpToCancelRefreshNullUndefined_0400] undefined obj is: " + JSON.stringify(obj.$attrs.pullUpToCancelRefresh));

      // Refresh pullUpToCancelRefresh 设置undefined
      expect(obj.$attrs.pullUpToCancelRefresh).assertEqual(true);
      console.info('[pullUpToCancelRefreshNullUndefined_0400] END');
    })

    // ========== pullDownRatio tests ==========
    /**
     * @tc.name   pullDownRatioNullUndefined_0100
     * @tc.number pullDownRatioNullUndefined_0100
     * @tc.desc   Test Refresh pullDownRatio property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('pullDownRatioNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[pullDownRatioNullUndefined_0100] START');
      let strJsonCompare: string = getInspectorByKey('refresh_pullDownRatio_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('refresh_pullDownRatio_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[pullDownRatioNullUndefined_0100] type: " + JSON.stringify(obj.$type));
      console.info("[pullDownRatioNullUndefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs.pullDownRatio));
      console.info("[pullDownRatioNullUndefined_0100] null obj is: " + JSON.stringify(obj.$attrs.pullDownRatio));

      // Refresh pullDownRatio 设置null
      expect(obj.$attrs.pullDownRatio).assertEqual(objCompare.$attrs.pullDownRatio);
      console.info('[pullDownRatioNullUndefined_0100] END');
    })

    /**
     * @tc.name   pullDownRatioNullUndefined_0200
     * @tc.number pullDownRatioNullUndefined_0200
     * @tc.desc   Test Refresh pullDownRatio property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('pullDownRatioNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[pullDownRatioNullUndefined_0200] START');
      let strJsonCompare: string = getInspectorByKey('refresh_pullDownRatio_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('refresh_pullDownRatio_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[pullDownRatioNullUndefined_0200] type: " + JSON.stringify(obj.$type));
      console.info("[pullDownRatioNullUndefined_0200] default obj is: " + JSON.stringify(objCompare.$attrs.pullDownRatio));
      console.info("[pullDownRatioNullUndefined_0200] undefined obj is: " + JSON.stringify(obj.$attrs.pullDownRatio));

      // Refresh pullDownRatio 设置undefined
      expect(obj.$attrs.pullDownRatio).assertEqual(objCompare.$attrs.pullDownRatio);
      console.info('[pullDownRatioNullUndefined_0200] END');
    })

    // ========== maxPullDownDistance tests ==========
    /**
     * @tc.name   maxPullDownDistanceNullUndefined_0100
     * @tc.number maxPullDownDistanceNullUndefined_0100
     * @tc.desc   Test Refresh maxPullDownDistance property with  null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('maxPullDownDistanceNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[maxPullDownDistanceNullUndefined_0100] START');
      let strJsonCompare: string = getInspectorByKey('refresh_maxPullDownDistance_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('refresh_maxPullDownDistance_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[maxPullDownDistanceNullUndefined_0100] type: " + JSON.stringify(obj.$type));
      console.info("[maxPullDownDistanceNullUndefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs.maxPullDownDistance));
      console.info("[maxPullDownDistanceNullUndefined_0100] null obj is: " + JSON.stringify(obj.$attrs.maxPullDownDistance));

      // Refresh maxPullDownDistance 设置null
      expect(obj.$attrs.maxPullDownDistance).assertEqual(objCompare.$attrs.maxPullDownDistance);
      console.info('[maxPullDownDistanceNullUndefined_0100] END');
    })

    /**
     * @tc.name   maxPullDownDistanceNullUndefined_0200
     * @tc.number maxPullDownDistanceNullUndefined_0200
     * @tc.desc   Test Refresh maxPullDownDistance property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('maxPullDownDistanceNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[maxPullDownDistanceNullUndefined_0200] START');
      let strJsonCompare: string = getInspectorByKey('refresh_maxPullDownDistance_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('refresh_maxPullDownDistance_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[maxPullDownDistanceNullUndefined_0200] type: " + JSON.stringify(obj.$type));
      console.info("[maxPullDownDistanceNullUndefined_0200] default obj is: " + JSON.stringify(objCompare.$attrs.maxPullDownDistance));
      console.info("[maxPullDownDistanceNullUndefined_0200] undefined obj is: " + JSON.stringify(obj.$attrs.maxPullDownDistance));

      // Refresh maxPullDownDistance 设置undefined
      expect(obj.$attrs.maxPullDownDistance).assertEqual(objCompare.$attrs.maxPullDownDistance);
      console.info('[maxPullDownDistanceNullUndefined_0200] END');
    })
  })
}
