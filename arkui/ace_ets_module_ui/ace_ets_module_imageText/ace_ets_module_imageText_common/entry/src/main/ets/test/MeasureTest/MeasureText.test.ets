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
import { describe, beforeEach, it, expect, Level } from '@ohos/hypium';
import { MeasureText } from '@kit.ArkUI';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function MeasureTextTest() {
  describe('MeasureTextTest', () => {
    beforeEach(async (done: Function) => {
      console.info("MeasureTextTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Measure/MeasureText',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get MeasureTextTest state pages: " + JSON.stringify(pages));
        if (!("MeasureText" == pages.name)) {
          console.info("get MeasureTextTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push MeasureTextTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push MeasureTextTest page error: " + err);
      }
      done();
    });

    /**
     * @tc.name   measureText_0001
     * @tc.number measureText_0001
     * @tc.desc   测试 MeasureText measureText 属性参数 options为 null 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('measureText_0001', Level.LEVEL2, async (done: Function) => {
      console.info('measureText_0001 start');
      try {
        const result = MeasureText.measureText(null);
        expect(result).assertEqual(undefined);
        console.info('measureText_0001 end');
      } catch (err) {
        console.error('measureText_0001 error: ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   measureText_0002
     * @tc.number measureText_0002
     * @tc.desc   测试 MeasureText measureText 属性参数 options为 undefined 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('measureText_0002', Level.LEVEL2, async (done: Function) => {
      console.info('measureText_0002 start');
      try {
        const result = MeasureText.measureText(undefined);
        expect(result).assertEqual(undefined);
        console.info('measureText_0002 end');
      } catch (err) {
        console.error('measureText_0002 error: ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   measureText_0003
     * @tc.number measureText_0003
     * @tc.desc   测试 MeasureText measureText 属性参数 textContent为 空字符串 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('measureText_0003', Level.LEVEL2, async (done: Function) => {
      console.info('measureText_0003 start');
      try {
        const result = MeasureText.measureText({
          textContent: ''
        });
        expect(result == 0).assertFalse();
        console.info('measureText_0003 end');
        done();
      } catch (err) {
        console.error('measureText_0003 error: ' + JSON.stringify(err));
        
        done();
      }
    });

    /**
     * @tc.name   measureTextSize_0001
     * @tc.number measureTextSize_0001
     * @tc.desc   测试 MeasureText measureTextSize 属性参数 options为 null 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('measureTextSize_0001', Level.LEVEL2, async (done: Function) => {
      console.info('measureTextSize_0001 start');
      try {
        const result = MeasureText.measureTextSize(null);
        expect(result.width).assertEqual(0);
        expect(result.height).assertEqual(0);
        console.info('measureTextSize_0001 end');
        done();
      } catch (err) {
        console.error('measureTextSize_0001 error: ' + JSON.stringify(err));
        
        done();
      }
    });

    /**
     * @tc.name   measureTextSize_0002
     * @tc.number measureTextSize_0002
     * @tc.desc   测试 MeasureText measureTextSize 属性参数 options为 undefined 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('measureTextSize_0002', Level.LEVEL2, async (done: Function) => {
      console.info('measureTextSize_0002 start');
      try {
        const result = MeasureText.measureTextSize(undefined);
        expect(result.width).assertEqual(0);
        expect(result.height).assertEqual(0);
        console.info('measureTextSize_0002 end');
      } catch (err) {
        console.error('measureTextSize_0002 error: ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   measureTextSize_0003
     * @tc.number measureTextSize_0003
     * @tc.desc   测试 MeasureText measureTextSize 属性参数 textContent为 空字符串 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('measureTextSize_0003', Level.LEVEL2, async (done: Function) => {
      console.info('measureTextSize_0003 start');
      try {
        const result = MeasureText.measureTextSize({
          textContent: ''
        });
        expect(result.width).assertEqual(0);
        expect(result.height).assertLarger(0);
        console.info('measureTextSize_0003 end');
      } catch (err) {
        console.error('measureTextSize_0003 error: ' + JSON.stringify(err));
      }
      done();
    });
  });
}
