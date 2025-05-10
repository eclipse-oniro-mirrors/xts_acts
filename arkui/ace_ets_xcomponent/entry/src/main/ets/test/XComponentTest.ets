/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

import router from '@ohos.router';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import Utils from './Utils'

export default function XComponentTestJsunit() {
  describe('XComponentTest', () => {

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("xclog after each called");
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0100
     * @tc.name      XComponentTest001
     * @tc.desc      aceXComponentEtsTest
     */
    it('XComponentTest001', 0, async (done: Function) => {
      await Utils.sleep(1500);
      console.info('XComponentTest001 START');

      let result: boolean = false;
      if (!globalThis.xcomponentContext2) {
        console.error('xcomponentContext2 null');
        expect(result).assertEqual(true);
        done();
      } else {
        result = globalThis.xcomponentContext2.TestOnSurfaceCreated();
        expect(result).assertEqual(true);
        done();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0200
     * @tc.name      XComponentTest002
     * @tc.desc      aceXComponentEtsTest
     */
    it('XComponentTest002', 0, async (done: Function) => {
      await Utils.sleep(1000);
      console.info('xclog XComponentTest002 START');    

      let xcomponentContext1: Record<string, () => void> = globalThis.xcomponentContext1;
      let xcomponentId1: string = globalThis.xcomponentId1;

      let result: boolean = false;
      if (!xcomponentContext1) {
        console.error('xcomponentContext1 null');
        result = false;
        expect(result).assertEqual(xcomponentId1);
        done();
      }
      else if (xcomponentId1 != 'xcomponentId1'){
        console.error('xcomponentId1 is undefined');
        result = false;
        expect(result).assertEqual(xcomponentId1);
        done();
      }
      else {
        expect(xcomponentContext1.TestGetXComponentId()).assertEqual(xcomponentId1);
        done();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0300
     * @tc.name      XComponentTest003
     * @tc.desc      aceXComponentEtsTest
     */
    it('XComponentTest003', 0, async (done: Function) => {
      await Utils.sleep(1000);
      console.info('xclog XComponentTest003 START');

      let xcomponentContext2: Record<string, () => void> = globalThis.xcomponentContext2;
      let xcomponentId2: string = globalThis.xcomponentId2;

      let result: boolean = false;
      if (!xcomponentContext2) {
        console.error('xcomponentContext2 null');
        result = false;
        expect(result).assertEqual(xcomponentId2);
        done();
      }
      else if (xcomponentId2 != 'xcomponentId2'){
        console.error('xcomponentId2 is undefined');
        result = false;
        expect(result).assertEqual(xcomponentId2);
        done();
      }
      else {
        expect(xcomponentContext2.TestGetXComponentId()).assertEqual(xcomponentId2);
        done();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0400
     * @tc.name      XComponentTest004
     * @tc.desc      aceXComponentEtsTest
     */
    it('XComponentTest004', 0, async (done: Function) => {
      await Utils.sleep(1000);
      console.info('xclog XComponentTest004 START');

      let xcomponentContext1: Record<string, () => number> = globalThis.xcomponentContext1;
      let xcomponentHeight: number = globalThis.xcomponentHeight;
      let xcomponentWidth: number = globalThis.xcomponentWidth;

      let result_height: number = 0;
      let result_width: number = 0;
      let undef: number = 0;

      if (!xcomponentContext1) {
        console.error('xcomponentContext null');
        result_height = -1;
        result_width = -1;
        expect(result_height).assertEqual(xcomponentHeight);
        expect(result_width).assertEqual(xcomponentWidth);
        done();
      }
      else if ((xcomponentHeight === undef) || (xcomponentWidth === undef)){
        console.error('xcomponentHeight and xcomponentWidth are undefined');
        result_height = -1;
        result_width = -1;
        expect(result_height).assertEqual(xcomponentHeight);
        expect(result_width).assertEqual(xcomponentWidth);
        done();
      }
      else {
        result_height = xcomponentContext1.TestGetXComponentSize_Height();
        result_width  = xcomponentContext1.TestGetXComponentSize_Width();
        expect(result_height).assertEqual(xcomponentHeight);
        expect(result_width).assertEqual(xcomponentWidth);
        done();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0500
     * @tc.name      XComponentTest005
     * @tc.desc      aceXComponentEtsTest
     */
    it('XComponentTest005', 0, async (done: Function) => {
      await Utils.sleep(1000);
      console.info('xclog XComponentTest005 START');


      let xcomponentContext2: Record<string, () => number> = globalThis.xcomponentContext2;
      let xcomponentHeight: number = globalThis.xcomponentHeight;
      let xcomponentWidth: number = globalThis.xcomponentWidth;

      let result_height: number = 0;
      let result_width: number = 0;
      let undef: number = 0;

      if (!xcomponentContext2) {
        console.error('xcomponentContext2 null');
        result_height = -1;
        result_width = -1;
        expect(result_height).assertEqual(xcomponentHeight);
        expect(result_width).assertEqual(xcomponentWidth);
        done();
      }
      else if ((xcomponentHeight === undef) || (xcomponentWidth === undef)) {
        console.error('xcomponentHeight and xcomponentWidth are undefined');
        result_height = -1;
        result_width = -1;
        expect(result_height).assertEqual(xcomponentHeight);
        expect(result_width).assertEqual(xcomponentWidth);
        done();
      }
      else {
        result_height = xcomponentContext2.TestGetXComponentSize_Height();
        result_width = xcomponentContext2.TestGetXComponentSize_Width();
        expect(result_height).assertEqual(xcomponentHeight);
        expect(result_width).assertEqual(xcomponentWidth);
        done();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0600
     * @tc.name      XComponentTest006
     * @tc.desc      aceXComponentEtsTest
     */
    it('XComponentTest006', 0, async (done: Function) => {
      await Utils.sleep(1000);
      console.info('xclog XComponentTest006 START');
      let x_value = 340;
      let y_value = 350;
      //x:300 y:430左右范围是xcomponent.context2的changelayout范围
      //x:300 y:150左右范围是xcomponent.context1的changeshape范围


      let xcomponentContext1: Record<string, () => ESObject> = globalThis.xcomponentContext1;
      let insidex: number = globalThis.index;

      let result: boolean = false;
      let inside_x: number = 0;
      let inside_y: number = 0;
      let button_t: number = 0;
      if (!xcomponentContext1) {
        console.error('xclog xcomponentContext null')
        result = false;
      } else {
          result = true;
          await Utils.sleep(1000);
          inside_x = xcomponentContext1.TestGetXComponent_MouseEvent().surface_X1;
          inside_y = xcomponentContext1.TestGetXComponent_MouseEvent().surface_Y1;
          button_t = xcomponentContext1.TestGetXComponent_MouseEvent().mousebutton;

          console.info('xclog ets touchEvent: surf_x1 is '+ inside_x + ', surf_y1 is '+ inside_y + ', button_t is ' + button_t );

      }
      expect(result).assertEqual(true);
      expect(inside_x).assertEqual(insidex);
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0700
     * @tc.name      XComponentTest007
     * @tc.desc      aceXComponentEtsTest
     */
    it('XComponentTest007', 0, async (done: Function) => {
      await Utils.sleep(1000);
      console.info('xclog XComponentTest007 START');
      //let x_value = 340;
      //let y_value = 350;
      //x:300 y:430左右范围是xcomponent.context2的changelayout范围
      //x:300 y:150左右范围是xcomponent.context1的changeshape范围


      let xcomponentContext2: Record<string, () => ESObject> = globalThis.xcomponentContext2;
      let callback_: number = globalThis.callback_;


      let result: boolean = false;
      let callback: number = -1;
      if (!xcomponentContext2) {
        console.error('xclog xcomponentContext null')
        result = false;
      } else {
          result = true;
          await Utils.sleep(1000);
          callback = xcomponentContext2.TestGetXComponent_RegisterMouseEventCallback().MouseCallback_;
          console.info('xclog ets touchEvent: callback is ' + callback );

      }
      
      expect(result).assertEqual(true);
      expect(callback).assertEqual(callback_);
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0800
     * @tc.name      XComponentTest008
     * @tc.desc      aceXComponentEtsTest
     */
  it('XComponentTest008', 0, async (done: Function) => {
      await Utils.sleep(1000);
      console.info('xclog XComponentTest008 START');
      //let x_value = 340;
      //let y_value = 350;
      //x:300 y:430左右范围是xcomponent.context2的changelayout范围
      //x:300 y:150左右范围是xcomponent.context1的changeshape范围

      let xcomponentContext1: Record<string, () => boolean> = globalThis.xcomponentContext1;
      let type_: number = globalThis.type_;

      let result: boolean = false;
      let tilty: boolean = false;
      let tiltx: boolean = false;
      let type_t: boolean = false;
      if (!xcomponentContext1) {
        console.error('xclog xcomponentContext null')
        result = false;
      } else {
        result = true;
        await Utils.sleep(1000);
        tilty = xcomponentContext1.TestGetXComponentpointtool_tilty();
        type_t = xcomponentContext1.TestGetXComponentpointtool_type();
        tiltx = xcomponentContext1.TestGetXComponentpointtool_tiltx();
        console.info('xclog ets touchEvent: surf_x is '+ tiltx + ', surf_y is '+ tilty + ', type_t is ' + type_t );
      } 
      expect(result).assertEqual(true);
      expect(type_t).assertEqual(type_);
      done();
    });

  })
}
