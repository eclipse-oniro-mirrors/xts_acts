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

import { beforeAll, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import { Driver, ON } from '@ohos.UiTest';

export default function imageSpanTest() {
  describe('ImageSpanTest', () => {

    const PAGE_TAG = 'ImageSpanTest';
    const IMAGE_ID = 'imageSpan';       

    beforeAll(async (done: Function) => {

      await Utils.pushPage(`imageSpanTest/${PAGE_TAG}`, done);
    });

    /**
     * @tc.name   imageSpanTest_0010
     * @tc.number imageSpanTest_0010
     * @tc.desc   input 10,return ImageSrc::resources/base/media/strokefile.svg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('imageSpanTest_0010', Level.LEVEL1, async (done: Function) => {
      console.info('[ImageSpanTest_0010] START');

      await Utils.sleep(200);


      const dumpStr: string = await getInspectorByKey(IMAGE_ID);
      const node: ESObject = JSON.parse(dumpStr);
      const src: string = node.$attrs.src;
      console.info(`[imageSpanTest_001] src = ${src}`);
      expect(src).assertEqual('resources/base/media/strokefile.svg');

      console.info('[ImageSpanTest_001] END');
      done();
    });

    /**
     * @tc.name   imageSpanTest_0020
     * @tc.number imageSpanTest_0020
     * @tc.desc   input 20,return ImageSize::width=300.00vp;height=500.00vp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('imageSpanTest_0020', Level.LEVEL1, async (done: Function) => {
      console.info('[imageSpanTest_0020] START');

      await Utils.sleep(200);

      const dumpStr: string = await getInspectorByKey(IMAGE_ID);
      const node: ESObject = JSON.parse(dumpStr);
      const width: string = node.$attrs.width;
      const height: string = node.$attrs.height;
      console.info(`[imageSpanTest_002] width = ${width}, height = ${height}`);
      expect(width).assertEqual('300.00vp');
      expect(height).assertEqual('500.00vp');

      console.info('[imageSpanTest_002] END');
      done();
    });

    /**
     * @tc.name   imageSpanTest_0030
     * @tc.number imageSpanTest_0030
     * @tc.desc   input 30,return TextContent::1.0000000.000000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('imageSpanTest_0030', Level.LEVEL1, async (done: Function) => {
      console.info('[imageSpanTest_0030] START');

      await Utils.sleep(200);

      const dumpStr: string = await getInspectorByKey("textID1");
      const node: ESObject = JSON.parse(dumpStr);
      console.info('yjf_003_1');
      const colorFilter: string = node.$attrs.content;
      console.info('yjf_003_2');
      console.info(`[imageSpanTest_0030] colorFilter = ${colorFilter}`);
      expect(colorFilter).assertEqual('1.0000000.000000');
      console.info('[imageSpanTest_0030] END');
      done();
    });
  });
}