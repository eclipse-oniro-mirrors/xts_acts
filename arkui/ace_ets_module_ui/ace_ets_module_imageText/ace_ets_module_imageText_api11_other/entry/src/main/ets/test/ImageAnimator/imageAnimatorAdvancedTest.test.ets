/**
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium";
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function ImageAnimatorAdvancedTest() {

  describe('ImageAnimatorAdvancedTest', () =>  {

    const routerPush = async (target:string) => {
      let options:router.RouterOptions = {
        url: `MainAbility/pages/ImageAnimator/imageAnimatorAdvanced/${target}`,
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info(`get ${target} state pages:` + JSON.stringify(pages));
        console.info(`get ${target} pages.name:` + JSON.stringify(pages.name));
        if (!(target == pages.name)) {
          let result = router.push(options);
          await CommonFunc.sleep(1000);
          console.info(`push ${target} page result:` + JSON.stringify(result));
          let pages = router.getState();
          expect(pages.name).assertEqual(target)
        }
      } catch (err) {
        console.error(`push ${target} page error:` + err);
      }
    }

    beforeAll(async () =>  {
      console.info("beforeAll called");
    })

    beforeEach(async () =>  {
      console.info("before each called");
    });

    afterEach(async () =>  {
      await CommonFunc.sleep(1000);
      console.info("after each called");
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0120
     * @tc.number SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0120
     * @tc.desc   set images,height = 100px
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0120', Level.LEVEL3, async (done: Function) =>  {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0120] START');
      await routerPush('imageAnimator01')
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('imageAnimator01');
      let obj1: ESObject = JSON.parse(strJson1);
      let images:Array<ImageFrameInfo> = JSON.parse(obj1.$attrs.images)
      expect(images[0].height).assertEqual('100.00px');
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0130
     * @tc.number SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0130
     * @tc.desc   set images,height = 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0130', Level.LEVEL3, async (done: Function) =>  {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0130] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('imageAnimator01');
      let obj1: ESObject = JSON.parse(strJson1);
      let images:Array<ImageFrameInfo> = JSON.parse(obj1.$attrs.images)
      expect(images[1].height).assertEqual('100.00vp');
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0140
     * @tc.number SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0140
     * @tc.desc   set images,height = 50%
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0140', Level.LEVEL3, async (done: Function) =>  {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0140] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('imageAnimator01');
      let obj1: ESObject = JSON.parse(strJson1);
      let images:Array<ImageFrameInfo> = JSON.parse(obj1.$attrs.images)
      expect(images[2].height).assertEqual('50.00%');
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0150
     * @tc.number SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0150
     * @tc.desc   set images,height = outlier
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0150', Level.LEVEL3, async (done: Function) =>  {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0150] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('imageAnimator01');
      let obj1: ESObject = JSON.parse(strJson1);
      let images:Array<ImageFrameInfo> = JSON.parse(obj1.$attrs.images)
      expect(images[3].height).assertEqual('0.00vp');
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0160
     * @tc.number SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0160
     * @tc.desc   set images,height = 90
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0160', Level.LEVEL3, async (done: Function) =>  {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0160] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('imageAnimator01');
      let obj1: ESObject = JSON.parse(strJson1);
      let images:Array<ImageFrameInfo> = JSON.parse(obj1.$attrs.images)
      expect(images[4].height).assertEqual('90.00vp');
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0170
     * @tc.number SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0170
     * @tc.desc   set images,left = string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0170', Level.LEVEL3, async (done: Function) =>  {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0170] START');
      await routerPush('imageAnimator02')
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('imageAnimator02');
      let obj1: ESObject = JSON.parse(strJson1);
      let images:Array<ImageFrameInfo> = JSON.parse(obj1.$attrs.images)
      expect(images[1].left).assertEqual('30.00px');
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0180
     * @tc.number SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0180
     * @tc.desc   set images,left = number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0180', Level.LEVEL3, async (done: Function) =>  {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0180] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('imageAnimator02');
      let obj1: ESObject = JSON.parse(strJson1);
      let images:Array<ImageFrameInfo> = JSON.parse(obj1.$attrs.images)
      expect(images[2].left).assertEqual('30.00vp');
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0190
     * @tc.number SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0190
     * @tc.desc   set images, dont set left
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0190', Level.LEVEL3, async (done: Function) =>  {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0190] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('imageAnimator02');
      let obj1: ESObject = JSON.parse(strJson1);
      let images:Array<ImageFrameInfo> = JSON.parse(obj1.$attrs.images)
      expect(images[0].left).assertEqual('0.00px');
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0200
     * @tc.number SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0200
     * @tc.desc   set images,top = string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0200', Level.LEVEL3, async (done: Function) =>  {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0200] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('imageAnimator02');
      let obj1: ESObject = JSON.parse(strJson1);
      let images:Array<ImageFrameInfo> = JSON.parse(obj1.$attrs.images)
      expect(images[3].top).assertEqual('30.00px');
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0210
     * @tc.number SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0210
     * @tc.desc   set images,top = number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0210', Level.LEVEL3, async (done: Function) =>  {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0210] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('imageAnimator02');
      let obj1: ESObject = JSON.parse(strJson1);
      let images:Array<ImageFrameInfo> = JSON.parse(obj1.$attrs.images)
      expect(images[4].top).assertEqual('30.00vp');
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0220
     * @tc.number SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0220
     * @tc.desc   set images,dont set top
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0220', Level.LEVEL3, async (done: Function) =>  {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0220] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('imageAnimator02');
      let obj1: ESObject = JSON.parse(strJson1);
      let images:Array<ImageFrameInfo> = JSON.parse(obj1.$attrs.images)
      expect(images[0].top).assertEqual('0.00px');
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0230
     * @tc.number SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0230
     * @tc.desc   set images,width = 100px
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0230', Level.LEVEL3, async (done: Function) =>  {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0230] START');
      await routerPush('imageAnimator03')
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('imageAnimator03');
      let obj1: ESObject = JSON.parse(strJson1);
      let images:Array<ImageFrameInfo> = JSON.parse(obj1.$attrs.images)
      expect(images[0].width).assertEqual('100.00px');
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0240
     * @tc.number SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0240
     * @tc.desc   set images,width = 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0240', Level.LEVEL3, async (done: Function) =>  {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0240] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('imageAnimator03');
      let obj1: ESObject = JSON.parse(strJson1);
      let images:Array<ImageFrameInfo> = JSON.parse(obj1.$attrs.images)
      expect(images[1].width).assertEqual('100.00vp');
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0250
     * @tc.number SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0250
     * @tc.desc   set images,width = 50%
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0250', Level.LEVEL3, async (done: Function) =>  {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0250] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('imageAnimator03');
      let obj1: ESObject = JSON.parse(strJson1);
      let images:Array<ImageFrameInfo> = JSON.parse(obj1.$attrs.images)
      expect(images[2].width).assertEqual('50.00%');
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0260
     * @tc.number SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0260
     * @tc.desc   set images,width = outlier
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0260', Level.LEVEL3, async (done: Function) =>  {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0260] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('imageAnimator03');
      let obj1: ESObject = JSON.parse(strJson1);
      let images:Array<ImageFrameInfo> = JSON.parse(obj1.$attrs.images)
      expect(images[3].width).assertEqual('0.00vp');
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0270
     * @tc.number SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0270
     * @tc.desc   set images,width = 90
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0270', Level.LEVEL3, async (done: Function) =>  {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0270] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('imageAnimator03');
      let obj1: ESObject = JSON.parse(strJson1);
      let images:Array<ImageFrameInfo> = JSON.parse(obj1.$attrs.images)
      expect(images[4].width).assertEqual('90.00vp');
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0280
     * @tc.number SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0280
     * @tc.desc   set images,Referencing video path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0280', Level.LEVEL3, async (done: Function) =>  {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0280] START');
      await routerPush('imageAnimator04')
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('imageAnimator04');
      let obj1: ESObject = JSON.parse(strJson1);
      let images:Array<ImageFrameInfo> = JSON.parse(obj1.$attrs.images)
      console.info("images is: " + JSON.stringify(images));
      expect(images[0].src).assertEqual('H264_AAC.mp4');
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0290
     * @tc.number SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0290
     * @tc.desc   set images,Referencing gif or video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0290', Level.LEVEL3, async (done: Function) =>  {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0290] START');
      await routerPush('imageAnimator05')
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('imageAnimator05');
      let obj1: ESObject = JSON.parse(strJson1);
      let images:Array<ImageFrameInfo> = JSON.parse(obj1.$attrs.images)
      console.info("images is: " + JSON.stringify(images));
      expect(images[0].src).assertContain('.gif');
      expect(images[1].src).assertContain('.mp4');
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0300
     * @tc.number SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0300
     * @tc.desc   set images,Referencing rawfile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0300', Level.LEVEL3, async (done: Function) =>  {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0300] START');
      await routerPush('imageAnimator06')
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('imageAnimator06');
      let obj1: ESObject = JSON.parse(strJson1);
      let images:Array<ImageFrameInfo> = JSON.parse(obj1.$attrs.images)
      console.info("images is: " + JSON.stringify(images));
      expect(images[0].src).assertEqual('resource://RAWFILE/yyy.png');
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0310
     * @tc.number SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0310
     * @tc.desc   set images,Referencing jpg,png,svg,bmp,gif
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0310', Level.LEVEL3, async (done: Function) =>  {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0310] START');
      await routerPush('imageAnimator07')
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('imageAnimator07');
      let obj1: ESObject = JSON.parse(strJson1);
      let images:Array<ImageFrameInfo> = JSON.parse(obj1.$attrs.images)
      console.info("images is: " + JSON.stringify(images));
      expect(images[0].src).assertContain('.jpg');
      expect(images[1].src).assertContain('.png');
      expect(images[2].src).assertContain('.bmp');
      expect(images[3].src).assertContain('.svg');
      expect(images[4].src).assertContain('.gif');
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0330
     * @tc.number SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0330
     * @tc.desc   set images,Referencing base64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0330', Level.LEVEL3, async (done: Function) =>  {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0330] START');
      await routerPush('imageAnimator09')
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('imageAnimator09');
      let obj1: ESObject = JSON.parse(strJson1);
      let images:Array<ImageFrameInfo> = JSON.parse(obj1.$attrs.images)
      console.info("images is: " + JSON.stringify(images));
      expect(images[0].src).assertEqual('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACkAAAApCAYAAACoYAD2AAAAGXRF' +
        'WHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyVpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77' +
        'u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9' +
        'IkFkb2JlIFhNUCBDb3JlIDYuMC1jMDA2IDc5LjE2NDc1MywgMjAyMS8wMi8xNS0xMTo1MjoxMyAgICAgICAgIj4gPHJkZjpSREYgeG1sbn' +
        'M6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdX' +
        'Q9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmF' +
        'kb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZX' +
        'NvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIDIyLjMgKE1hY2ludG9zaCkiIHhtcE1NOkl' +
        'uc3RhbmNlSUQ9InhtcC5paWQ6ODQxMEIzN0QyRjQ1MTFFRUJFNUNFRTAwRjBCQTg0NkYiIHhtcE1NOkRvY3VtZW50SUQ9Inh' +
        'tcC5kaWQ6ODQxMEIzN0UyRjQ1MTFFRUJFNUNFRTAwRjBCQTg0NkYiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFu' +
        'Y2VJRD0ieG1wLmlpZDo4NDEwQjM3QjJGNDUxMUVFQkU1Q0VFMDBGMEJBODQ2RiIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZ' +
        'Do4NDEwQjM3QzJGNDUxMUVFQkU1Q0VFMDBGMEJBODQ2RiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6e' +
        'G1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PjnaUHsAAARqSURBVHjazFlNbFVFFP7u7Xul4ceYtkANBCUYFkQCttUFC8WkpIK' +
        'EgMqqtZgILmRTMLIwwZgYWWCsbGRTSUi1KyT8pAoGE4kLN20KpmICIWk1EmgpBFtLsK/t9Tsz0+a919uZeT/Fd5KZc++8me98M2' +
        '/mnDPvBfg4ghKjEJjnCNtZ72Cp5fNq6gSKLxO010/dy3Kez10z9qe5KJVNEtiMKRylfgGPX7oR4hD15XSSYUaXCAdJ8Kf/iSCUX' +
        'bEvPNIknWQrP/wcpSCaR2smyQj1nMEXKCURPsJrhuQUOlGKYniFZNtAvTbHryP9oM3fGOFFfglWLc6ugSmjLGMsZaZ9kmURy2Jk' +
        'e4iZk4l/5hizxJM4+Ynvq3MSnGAZBqpWAW+8DDz/lG6+egc4/Rtwd4Av1SxJ9RXpTZTSY5Y+wzGbgY01ms+V2xzTB9z704xJOIhG' +
        'qAtwOLrHx8o5CcrM7wLvbAHa6N6fqMjsMjYOHPoOOP4DX6qMUZkUUd9rBI6+xoUrzxwz8gg42AWcuMSXpWaV5yZ6XyDLrStJgi3c' +
        'tV+9Gf+xEPhyFxeOE2r/ng0r9Jh929i+M36MTFTwUiTW8SMbaqwMymUl/5ZxsR9zL1U+yUU57LfLlx8BhhjkljGIDn7oN6bqEy' +
        '7VA7NP42UktCLwoDTV+x/FtyVODRrtKQp/1N4ntLoMbobaGn+D65exqjDaUxS+4/CETu8T+BtMlmmDyTL/MT74ocv1XB30Nz' +
        'g5lal9ROFPpPnVnFeSDvebnvmNfAp/Sb4rCR1Jhv8A9p7xMxgGmdolgiv4MxEr3z0pzvYEHfV+Aj5M2btWL2T1r9EWERzBE1z' +
        'lzB2ScCYFSR1Jjl8Ezl0Hdm/QIS77cEjXzl917Gr7hZ5obPY2S03qUHqK/W71Z4VSa2S2OfP0QyRr/pcOdypGhTETkq/tWZa' +
        'bJrEIZqVewLgJnyvNuzszGkl4nX+TLKxYw5V83b6SF34Gtr5EJ72heCuZcK5gyiQLrwKfMcFYmLSERYa2C2eZPGwCGtbE99nD8i' +
        'lzgQ+6spKSQpy5yoAadRJhIygy/JDVAqMtIjiCJ7iCn78zNwlr9dPMWHZ5ZvtRpnaJ4Aq+2r95k2Tgb67HvEpzMRKMjcv9DZa' +
        'FmdpHFH6hezLK4fIkp1fisNK+97OokD1pEozeO/4G+4ZYPTLaUxR+oQlGZw4Jxslu8UNGe0qnZ4IR2hKM+4wye065jb1L/zg0oC' +
        'OJaHl3ieAKviPBCEMTqKwJhlyW9n6rb3mzrkHjOllov2iShSmt5V3ax2LQBUfw1CXMnWCMB/gousaTtc773r0+j3v3cwXcu4HfhWQ' +
        'HO71Vsr9gBPg6wcpNchpskSlZv8TGGppum2uM7xWD/EJWsjNu5BQmArvLKNoY4UV+oTnjTSX505/hFZpZ9vDpQIkRPKB4ZfnIY2x' +
        '8vyQIah7H4iNOgDa2vAL5FwDe6X0xpVvZFx7WzDzAZXZ8kQS38y6zgyRr6SdXs/3x/49j5D8BBgDvR27YO5AMoAAAAABJRU5ErkJ' +
        'ggg==');
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0380
     * @tc.number SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0380
     * @tc.desc   set images,Referencing internal img
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0380', Level.LEVEL3, async (done: Function) =>  {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0380] START');
      await routerPush('imageAnimator14')
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('imageAnimator14');
      let obj1: ESObject = JSON.parse(strJson1);
      let images:Array<ImageFrameInfo> = JSON.parse(obj1.$attrs.images)
      console.info("images is: " + JSON.stringify(images));
      expect(images[0].src).assertEqual('http://images.openharmony.cn/330-%E8%BF%90%E8%90%A5%E5%9B%BE/%E5%B0%81%E9%9D' +
        '%A2/%E5%8D%9A%E5%AE%A2/%E7%B3%BB%E5%88%97%E8%A7%A3%E8%AF%BB.png');
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0390
     * @tc.number SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0390
     * @tc.desc   set images,Referencing relative paths
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0390', Level.LEVEL3, async (done: Function) =>  {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_0390] START');
      await routerPush('imageAnimator15')
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('imageAnimator15');
      let obj1: ESObject = JSON.parse(strJson1);
      let images:Array<ImageFrameInfo> = JSON.parse(obj1.$attrs.images)
      console.info("images is: " + JSON.stringify(images));
      expect(images[0].src).assertEqual('images/test1.jpg');
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_LAYOUT_0010
     * @tc.number SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_LAYOUT_0010
     * @tc.desc   set width and height 400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_LAYOUT_0010', Level.LEVEL3, async (done: Function) =>  {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_LAYOUT_0010] START');
      await routerPush('imageAnimator16')
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('imageAnimator16');
      let obj1: ESObject = JSON.parse(strJson1);
      let images:Array<ImageFrameInfo> = JSON.parse(obj1.$attrs.images)
      console.info("images is: " + JSON.stringify(images));
      expect(images[0].width).assertEqual('0.00px');
      expect(images[0].height).assertEqual('0.00px');
      done();
    });
  })
}
