'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { expect, describe, it, afterEach, Level , beforeAll } from '../../../../hypium'
import { Driver, ON, PointerMatrix, Rect,Component } from '@ohos.UiTest'
import { Point } from '@ohos.UiTest';
import { UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import Utils from '../common/Utils'
import { UtilsTest } from '../Util.test'
import {LibUtil} from '../../../ets/pages/LibUtil'
let libUtil:LibUtil = new LibUtil();

async function panAndPinchGesture(id: string) {
  let driver = Driver.create();
  let refresh: Component | null = await driver.findComponent(ON.id(id)) ;
  let rect = await (refresh?.getBounds() as Promise<Rect>);
  let point: PointerMatrix = PointerMatrix.create(1, 999);
  let centerX = Math.round((rect.left + rect.right) / 2).toInt();
  let centerY = Math.round((rect.top + rect.bottom) / 2).toInt();
  let dragStartPoint1: Point = { x: centerX, y: centerY };
  for (let i = 0; i < 990; i++) {
    point.setPoint(0, i, dragStartPoint1);
  }
  let context:UIContext = AppStorage.get<UIContext>('uiContent') as UIContext
  point.setPoint(0, 990, { x: centerX, y: (Math.round(centerY + context.vp2px(20))).toInt()} as Point);
  point.setPoint(0, 991, { x: centerX, y: (Math.round(centerY + context.vp2px(40))).toInt()} as Point);
  point.setPoint(0, 992, { x: centerX, y: (Math.round(centerY + context.vp2px(60))).toInt()} as Point);
  point.setPoint(0, 993, { x: centerX, y: (Math.round(centerY + context.vp2px(80))).toInt()} as Point);
  point.setPoint(0, 994, { x: centerX, y: (Math.round(centerY + context.vp2px(100))).toInt()} as Point);
  point.setPoint(0, 995, { x: centerX, y: (Math.round(centerY + context.vp2px(120))).toInt()} as Point);
  point.setPoint(0, 996, { x: centerX, y: (Math.round(centerY + context.vp2px(140))).toInt()} as Point);
  point.setPoint(0, 997, { x: centerX, y: (Math.round(centerY + context.vp2px(160))).toInt()} as Point);
  point.setPoint(0, 998, { x: centerX, y: (Math.round(centerY + context.vp2px(200))).toInt()} as Point);
  await driver.injectMultiPointerAction(point);
  await Utils.sleep(1000);
}

export default function DragTest(){

  describe('DragTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_xts_api16.static", "EntryAbility")
    });
    afterEach(async (): Promise<void> => {
      await Utils.sleep(100)
    })

    
    /**
     * @tc.number   dragCaseTest001
     * @tc.name     dragCaseTest001
     * @tc.desc     dragCaseTest001
     * @tc.level    Level.LEVEL1
     */
    it('dragCaseTest001', Level.LEVEL1, async (done: () => void): Promise<void> => {
        let PAGE_TAG = 'DragCaseTest1'
        await Utils.pushPage(`drag/${PAGE_TAG}`)
        await panAndPinchGesture('image')
        let dataArray: number[] = libUtil.GetResult();
        console.log('dragCaseTest001', dataArray[0])
        expect( dataArray[0] == 0 ).assertEqual(true)
        done()
    })

    
    /**
     * @tc.number   dragCaseTest002
     * @tc.name     dragCaseTest002
     * @tc.desc     dragCaseTest002
     * @tc.level    Level.LEVEL1
     */
    it('dragCaseTest002', Level.LEVEL1, async (done: () => void): Promise<void> => {
        let PAGE_TAG = 'DragCaseTest2'
        await Utils.pushPage(`drag/${PAGE_TAG}`)
        await panAndPinchGesture('image')
        let dataArray: number[] = libUtil.GetResult();
        console.log('dragCaseTest002', dataArray[0])
        expect( dataArray[0] == 0 ).assertEqual(true)
        done()
    })

        
    /**
     * @tc.number   dragCaseTest003
     * @tc.name     dragCaseTest003
     * @tc.desc     dragCaseTest003
     * @tc.level    Level.LEVEL1
     */
    it('dragCaseTest003', Level.LEVEL1, async (done: () => void): Promise<void> => {
        let PAGE_TAG = 'DragCaseTest3'
        await panAndPinchGesture('image')
        let dataArray: number[] = libUtil.GetResult();
        console.log('dragCaseTest003', dataArray[0])
        expect( dataArray[0] == 0 ).assertEqual(true)
        done()
    })
  })
}