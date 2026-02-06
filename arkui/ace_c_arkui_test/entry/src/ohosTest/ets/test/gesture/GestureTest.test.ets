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

import { expect, describe, it, afterEach, Level } from '@ohos/hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'
import router from '@ohos.router';
import nativeRender from 'libnativerender.so'

export default function gestureTest() {

  describe('GestureTest', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LONG_PRESS_GESTURE001
     * @tc.name       : testLongPressGesture001
     * @tc.desc       : testing long Press 
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLongPressGesture001', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'LongPressGestureTest';
      await Utils.pushPage(`gesture/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver = await Driver.create()
      await Utils.sleep(1000)
      let column = await driver.findComponent(ON.id('longPressID'));
      await column.longClick();
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('longPressID').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });
     /*
     * @tc.number     : SUB_ARKUI_CAPI_Axis_Event_GESTURE001
     * @tc.name       : testAxisGestureTest001
     * @tc.desc       : test the axis event data when mouse scroll
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAxisGestureTest001', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'AxisGestureTest';
      await Utils.pushPage(`gesture/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver = await Driver.create()
      await Utils.sleep(1000)
      let rect = Utils.getComponentRect("swipeAxisID");
      let x = Math.round(globalThis.winLeft + Utils.getRectHorizontalCenterX(rect));
      let y = Math.round(globalThis.winTop + Utils.getRectVerticalCenterY(rect));
      console.info("testSwipeGesture001  x= " +  x  + ", y = " + y);
      await driver.mouseScroll({x:x, y:y}, true, 30);
      let dataArray: number[][] = nativeRender.GetGestureDataAxis();
      let router: number[] = dataArray[0];
      console.log("time:"+router[0]+",sourceType:"+router[1]+",toolType:"+router[2]+",pointerCount:"+router[3]+",pointerId:"+router[4]+
      ",pointerIdOne:"+router[5]+",x:"+router[6]+",XIndex:"+router[7]+",y:"+router[8]+",yIndex:"+router[9]+",displayX:"+router[10]+",displayXIndex:"+router[11]+
      ",displayY:"+router[12]+",displayYIndex:"+router[13]+",windowX:"+router[14]+",windowXIndex:"+router[15]+",windowY:"+router[16]+
      ",windowYIndex:"+router[17]+",vertical:"+router[18]+",horizontal:"+router[19]+",pinch:"+router[20])
      expect(router[0] > 0).assertTrue();
      expect(router[1]).assertEqual(1)
      expect(router[2]).assertEqual(3)
      expect(router[3]).assertEqual(1)
      expect(router[4]).assertEqual(0)
      expect(router[5]).assertEqual(0)
      expect(router[6] <= x).assertTrue();
      expect(router[7] <= x).assertTrue();  
      expect(router[8] <= x).assertTrue();
      expect(router[9] <= x).assertTrue();    
      expect(router[10] <= x).assertTrue(); 
      expect(router[11] <= x).assertTrue();
      expect(router[12] <= y).assertTrue();
      expect(router[13] <= y).assertTrue();  
      expect(router[14] <= x).assertTrue();
      expect(router[15] <= x).assertTrue(); 
      expect(router[16] <= y).assertTrue(); 
      expect(router[17] <= y).assertTrue();
      expect(router[18] <= 15).assertTrue();
      expect(router[19] <= 0).assertTrue();  
      expect(router[20] <= 0).assertTrue();
      done();
    });
    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPE_GESTURE001
     * @tc.name       : testSwipeGesture001
     * @tc.desc       : testing swipe guesture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwipeGesture001', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'SwipeGestureTest';
      await Utils.pushPage(`gesture/${PAGE_TAG}`);
      let driver = Driver.create();
      let rect = Utils.getComponentRect("swipeID");
      let x = Math.round(globalThis.winLeft + Utils.getRectHorizontalCenterX(rect));
      let y = Math.round(globalThis.winTop + Utils.getRectVerticalCenterY(rect));
      console.info("testSwipeGesture001  x= " +  x  + ", y = " + y);
      await driver.swipe(x, y, x, Math.round(y + vp2px(30)));
      await Utils.sleep(3000);
      expect(Utils.getComponentInfoByKey('swipeID').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_PAN_GESTURE001
     * @tc.name       : testPanGesture001
     * @tc.desc       : testing pan guesture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPanGesture001', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'PanGestureTest';
      let driver = Driver.create();
      await Utils.pushPage(`gesture/${PAGE_TAG}`);
      let rect = Utils.getComponentRect("panID");
      let x = Math.round(globalThis.winLeft + Utils.getRectHorizontalCenterX(rect));
      let y = Math.round(globalThis.winTop + Utils.getRectVerticalCenterY(rect));
      console.info("testSwipeGesture001  x= " +  x  + ", y = " + y);
      await driver.drag(x, y, Math.round(x + vp2px(30)), y);
      await Utils.sleep(2500);
      expect(Utils.getComponentInfoByKey('panID').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

  /*
  * @tc.number     : SUB_ARKUI_CAPI_PINCH_001
  * @tc.name       : test pinch 001
  * @tc.desc       : test pinch
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
  it('testPinchGesture001', Level.LEVEL1, async (done: Function) => {
    let PAGE_TAG = 'PinchGestureTest';
    await Utils.pushPage(`gesture/${PAGE_TAG}`);    
    let driver = await Driver.create()
    await Utils.sleep(1000)
    let column = await driver.findComponent(ON.id('PinchID'));
    await column.pinchOut(4.0);
    await Utils.sleep(1000)
    expect(Utils.getComponentInfoByKey('PinchID').$attrs.backgroundColor).assertEqual('#FF00FF00')
    done();
  })

  /*
  * @tc.number     : SUB_ARKUI_CAPI_ROTATE_001
  * @tc.name       : test rotate 001
  * @tc.desc       : test rotate
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
  it('testRotateGesture001', Level.LEVEL1, async (done: Function) => {
    let PAGE_TAG = 'RotateGestureTest';
    await Utils.pushPage(`gesture/${PAGE_TAG}`);    
    let driver = Driver.create()
    await Utils.sleep(1000);
    let rect = Utils.getComponentRect("rotateID");
    let x = Math.round(globalThis.winLeft + Utils.getRectHorizontalCenterX(rect));
    let y = Math.round(globalThis.winTop + Utils.getRectVerticalCenterY(rect));
    console.info("gestureNestScrollTest  x= " +  x  + ", y = " + y);
    // Simulate the rotate gesture
    let pointers: PointerMatrix = PointerMatrix.create(2,2);
    pointers.setPoint(0,0,{x: Math.round(x),y: Math.round(y)});
    pointers.setPoint(0,1,{x: Math.round(y),y: Math.round(y + vp2px(20))});
    pointers.setPoint(1,0,{x: Math.round(x),y: Math.round(y)});
    pointers.setPoint(1,1,{x: Math.round(x),y: Math.round(y + vp2px(20))});
    await driver.injectMultiPointerAction(pointers);
    await Utils.sleep(3000);
    expect(Utils.getComponentInfoByKey('rotateID').$attrs.backgroundColor).assertEqual('#FF00FF00')
    done();
  })

  /*
  * @tc.number     : SUB_ARKUI_CAPI_INTERRUPT_001
  * @tc.name       : test interrupt 001
  * @tc.desc       : test interrupt
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
  it('testInterruptGesture001', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'InterruptGestureTest';
      await Utils.pushPage(`gesture/${PAGE_TAG}`);
      let driver = Driver.create();
      let rect = Utils.getComponentRect('interruptID');
      let x = Math.round(globalThis.winLeft + Utils.getRectHorizontalCenterX(rect));
      let y = Math.round(globalThis.winTop + Utils.getRectVerticalCenterY(rect));
      console.info("testInterruptGesture001  x= " +  x  + ", y = " + y);
      await driver.drag(x, y, x, Math.round(y + vp2px(30)));
      // change page to interrupt Gesture
      try {
        let options: router.RouterOptions = {
          url: 'MainAbility/pages/testgesture',
        }
        router.clear();
        let result = await router.pushUrl(options);
        await Utils.sleep(2500);
        console.info("push SwipeGestureExample03Test page result:" + JSON.stringify(result));
           
      } catch (err) {
        console.error("push SwipeGestureExample03Test page error:" + err);
      }
      await router.back(); 
      await Utils.sleep(2500)
      expect(Utils.getComponentInfoByKey('interruptID').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
  })
  })
}
