/*
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {Component, Driver, UiWindow, ON, BY, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function bindControllerNullUndefined() {
  describe('bindControllerNullUndefined', () => {
    beforeEach(async (done: Function) => {
      console.info("bindControllerNullUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNodeNew/bindControllerNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get bindControllerNullUndefined state pages:" + JSON.stringify(pages));
        let result = await router.pushUrl(options);
        if (!("bindControllerNullUndefined" == pages.name)) {
          console.info("get bindControllerNullUndefined pages.name:" + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push bindControllerNullUndefined page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push bindControllerNullUndefined page error:" + err);
      }
      console.info("bindControllerNullUndefined beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("bindControllerNullUndefined after each called");
    });

    /**
     * @tc.number    bindControllerNullUndefined_0100
     * @tc.name      bindControllerNullUndefined_0100
     * @tc.desc      bindController Grid node null and undefined Test
     * @tc.level     Level2
     * @tc.type
     * @tc.size
     */
    it('bindControllerNullUndefined_0100', Level.LEVEL2, async (done: Function) => {
      console.info('bindControllerNullUndefined_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      console.info('[bindControllerGridNull1] ' + AppStorage.get('bindControllerGridNull1'));
      expect(AppStorage.get('bindControllerGridNull1')).assertEqual(100023);
      AppStorage.delete('bindControllerGridNull1')

      console.info('[bindControllerGridUn1] ' + AppStorage.get('bindControllerGridUn1'));
      expect(AppStorage.get('bindControllerGridUn1')).assertEqual(100023);
      AppStorage.delete('bindControllerGridUn1')
      console.info('[bindControllerNullUndefined_0100] END');
      done();
    });

    /**
     * @tc.number    bindControllerNullUndefined_0200
     * @tc.name      bindControllerNullUndefined_0200
     * @tc.desc      bindController Grid controller null and undefined Test
     * @tc.level     Level2
     * @tc.type
     * @tc.size
     */
    it('bindControllerNullUndefined_0200', Level.LEVEL2, async (done: Function) => {
      console.info('bindControllerNullUndefined_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      console.info('[bindControllerGridNull2] ' + AppStorage.get('bindControllerGridNull2'));
      expect(AppStorage.get('bindControllerGridNull2')).assertEqual(100023);
      AppStorage.delete('bindControllerGridNull2')

      console.info('[bindControllerGridUn2] ' + AppStorage.get('bindControllerGridUn2'));
      expect(AppStorage.get('bindControllerGridUn2')).assertEqual(100023);
      AppStorage.delete('bindControllerGridUn2')
      console.info('[bindControllerNullUndefined_0200] END');
      done();
    });

    /**
     * @tc.number    bindControllerNullUndefined_0300
     * @tc.name      bindControllerNullUndefined_0300
     * @tc.desc      bindController Scroll node null and undefined Test
     * @tc.level     Level2
     * @tc.type
     * @tc.size
     */
    it('bindControllerNullUndefined_0300', Level.LEVEL2, async (done: Function) => {
      console.info('bindControllerNullUndefined_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      console.info('[bindControllerScrollNull1] ' + AppStorage.get('bindControllerScrollNull1'));
      expect(AppStorage.get('bindControllerScrollNull1')).assertEqual(401);
      AppStorage.delete('bindControllerScrollNull1')

      console.info('[bindControllerScrollUn1] ' + AppStorage.get('bindControllerScrollUn1'));
      expect(AppStorage.get('bindControllerScrollUn1')).assertEqual(401);
      AppStorage.delete('bindControllerScrollUn1')
      console.info('[bindControllerNullUndefined_0300] END');
      done();
    });

    /**
     * @tc.number    bindControllerNullUndefined_0400
     * @tc.name      bindControllerNullUndefined_0400
     * @tc.desc      bindController Scroll controller null and undefined Test
     * @tc.level     Level2
     * @tc.type
     * @tc.size
     */
    it('bindControllerNullUndefined_0400', Level.LEVEL2, async (done: Function) => {
      console.info('bindControllerNullUndefined_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      console.info('[bindControllerScrollNull2] ' + AppStorage.get('bindControllerScrollNull2'));
      expect(AppStorage.get('bindControllerScrollNull2')).assertEqual(401);
      AppStorage.delete('bindControllerScrollNull2')

      console.info('[bindControllerScrollUn2] ' + AppStorage.get('bindControllerScrollUn2'));
      expect(AppStorage.get('bindControllerScrollUn2')).assertEqual(401);
      AppStorage.delete('bindControllerScrollUn2')
      console.info('[bindControllerNullUndefined_0400] END');
      done();
    });

    /**
     * @tc.number    bindControllerNullUndefined_0500
     * @tc.name      bindControllerNullUndefined_0500
     * @tc.desc      bindController List node null and undefined Test
     * @tc.level     Level2
     * @tc.type
     * @tc.size
     */
    it('bindControllerNullUndefined_0500', Level.LEVEL2, async (done: Function) => {
      console.info('bindControllerNullUndefined_0500 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      console.info('[bindControllerListNull1] ' + AppStorage.get('bindControllerListNull1'));
      expect(AppStorage.get('bindControllerListNull1')).assertEqual(100023);
      AppStorage.delete('bindControllerListNull1')

      console.info('[bindControllerListUn1] ' + AppStorage.get('bindControllerListUn1'));
      expect(AppStorage.get('bindControllerListUn1')).assertEqual(100023);
      AppStorage.delete('bindControllerListUn1')
      console.info('[bindControllerNullUndefined_0500] END');
      done();
    });

    /**
     * @tc.number    bindControllerNullUndefined_0600
     * @tc.name      bindControllerNullUndefined_0600
     * @tc.desc      bindController List controller null and undefined Test
     * @tc.level     Level2
     * @tc.type
     * @tc.size
     */
    it('bindControllerNullUndefined_0600', Level.LEVEL2, async (done: Function) => {
      console.info('bindControllerNullUndefined_0600 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      console.info('[bindControllerListNull2] ' + AppStorage.get('bindControllerListNull2'));
      expect(AppStorage.get('bindControllerListNull2')).assertEqual(100023);
      AppStorage.delete('bindControllerListNull2')

      console.info('[bindControllerListUn2] ' + AppStorage.get('bindControllerListUn2'));
      expect(AppStorage.get('bindControllerListUn2')).assertEqual(100023);
      AppStorage.delete('bindControllerListUn2')
      console.info('[bindControllerNullUndefined_0600] END');
      done();
    });

    /**
     * @tc.number    bindControllerNullUndefined_0700
     * @tc.name      bindControllerNullUndefined_0700
     * @tc.desc      bindController WaterFlow node null and undefined Test
     * @tc.level     Level2
     * @tc.type
     * @tc.size
     */
    it('bindControllerNullUndefined_0700', Level.LEVEL2, async (done: Function) => {
      console.info('bindControllerNullUndefined_0700 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      console.info('[bindControllerWaterFlowNull1] ' + AppStorage.get('bindControllerWaterFlowNull1'));
      expect(AppStorage.get('bindControllerWaterFlowNull1')).assertEqual(100023);
      AppStorage.delete('bindControllerWaterFlowNull1')

      console.info('[bindControllerWaterFlowUn1] ' + AppStorage.get('bindControllerWaterFlowUn1'));
      expect(AppStorage.get('bindControllerWaterFlowUn1')).assertEqual(100023);
      AppStorage.delete('bindControllerWaterFlowUn1')
      console.info('[bindControllerNullUndefined_0700] END');
      done();
    });

    /**
     * @tc.number    bindControllerNullUndefined_0800
     * @tc.name      bindControllerNullUndefined_0800
     * @tc.desc      bindController WaterFlow controller null and undefined Test
     * @tc.level     Level2
     * @tc.type
     * @tc.size
     */
    it('bindControllerNullUndefined_0800', Level.LEVEL2, async (done: Function) => {
      console.info('bindControllerNullUndefined_0800 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      console.info('[bindControllerWaterFlowNull2] ' + AppStorage.get('bindControllerWaterFlowNull2'));
      expect(AppStorage.get('bindControllerWaterFlowNull2')).assertEqual(100023);
      AppStorage.delete('bindControllerWaterFlowNull2')

      console.info('[bindControllerWaterFlowUn2] ' + AppStorage.get('bindControllerWaterFlowUn2'));
      expect(AppStorage.get('bindControllerWaterFlowUn2')).assertEqual(100023);
      AppStorage.delete('bindControllerWaterFlowUn2')
      console.info('[bindControllerNullUndefined_0800] END');
      done();
    });

    /**
     * @tc.number    bindControllerNullUndefined_0900
     * @tc.name      bindControllerNullUndefined_0900
     * @tc.desc      bindController Swiper node null and undefined Test
     * @tc.level     Level2
     * @tc.type
     * @tc.size
     */
    it('bindControllerNullUndefined_0900', Level.LEVEL2, async (done: Function) => {
      console.info('bindControllerNullUndefined_0900 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      console.info('[bindControllerSwiperNull1] ' + AppStorage.get('bindControllerSwiperNull1'));
      expect(AppStorage.get('bindControllerSwiperNull1')).assertEqual(100023);
      AppStorage.delete('bindControllerSwiperNull1')

      console.info('[bindControllerSwiperUn1] ' + AppStorage.get('bindControllerSwiperUn1'));
      expect(AppStorage.get('bindControllerSwiperUn1')).assertEqual(100023);
      AppStorage.delete('bindControllerSwiperUn1')
      console.info('[bindControllerNullUndefined_0900] END');
      done();
    });

    /**
     * @tc.number    bindControllerNullUndefined_1000
     * @tc.name      bindControllerNullUndefined_1000
     * @tc.desc      bindController Swiper controller null and undefined Test
     * @tc.level     Level2
     * @tc.type
     * @tc.size
     */
    it('bindControllerNullUndefined_1000', Level.LEVEL2, async (done: Function) => {
      console.info('bindControllerNullUndefined_1000 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      console.info('[bindControllerSwiperNull2] ' + AppStorage.get('bindControllerSwiperNull2'));
      expect(AppStorage.get('bindControllerSwiperNull2')).assertEqual(100023);
      AppStorage.delete('bindControllerSwiperNull2')

      console.info('[bindControllerSwiperUn2] ' + AppStorage.get('bindControllerSwiperUn2'));
      expect(AppStorage.get('bindControllerSwiperUn2')).assertEqual(100023);
      AppStorage.delete('bindControllerSwiperUn2')
      console.info('[bindControllerNullUndefined_1000] END');
      done();
    });
  })
}