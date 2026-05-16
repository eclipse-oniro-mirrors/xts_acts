'use static';
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

import {
  Column,
  Text,
  Component,
  Entry,
  TapGesture,
  PanGesture,
  PanGestureOptions,
  GestureEvent,
  PanDirection,
  SourceTool,
  FlexAlign,
  GestureType,
  GestureMask,
  Callback,
} from '@ohos.arkui.component';
import { AppStorage } from '@ohos.arkui.stateManagement';

function gesturePanDistanceMap(): Map<SourceTool, number> {
  let m: Map<SourceTool, number> = new Map<SourceTool, number>();
  m.set(SourceTool.Finger, 12);
  return m;
}

/** 与页面 PanGesture 配置一致的最小触发距离；Evolution 下不可用 object 下标调用 getGestureRecognizer。 */
function writePanRecognizerDistanceOrFallback(_event: GestureEvent): void {
  let po = new PanGestureOptions({
    fingers: 1,
    direction: PanDirection.Horizontal,
    distance: 1,
  });
  AppStorage.setOrCreate<string>('gesture_probe_pan_rec_dist', String(po.getDistance()));
}

/** 真实手势回调写入 AppStorage，供 Hypium 用 sendTouchEvent / Driver 触发后断言。 */
@Entry
@Component
struct GestureApiProbe {
  aboutToAppear(): void {
    AppStorage.setOrCreate<string>('gesture_probe_page', '1');
    AppStorage.setOrCreate<string>('gesture_probe_pan_cfg_dm_size', String(gesturePanDistanceMap().size));
  }

  build() {
    let onTap: Callback<GestureEvent> = (event: GestureEvent): void => {
      AppStorage.setOrCreate<string>('gesture_probe_tap_fire', '1');
      AppStorage.setOrCreate<string>('gesture_probe_tap_finger_len', String(event.fingerList.length));
      let targetId = event.target.id;
      if (targetId !== undefined && targetId.length > 0) {
        AppStorage.setOrCreate<string>('gesture_probe_touch_target_id', targetId);
      }
      let tapLoc = event.tapLocation;
      if (tapLoc !== undefined) {
        AppStorage.setOrCreate<string>('gesture_probe_tap_loc_x', String(tapLoc.x));
        AppStorage.setOrCreate<string>('gesture_probe_tap_loc_y', String(tapLoc.y));
        let gdx = tapLoc.globalDisplayX;
        let gdy = tapLoc.globalDisplayY;
        if (gdx !== undefined) {
          AppStorage.setOrCreate<string>('gesture_probe_tap_loc_gdx', String(gdx));
        }
        if (gdy !== undefined) {
          AppStorage.setOrCreate<string>('gesture_probe_tap_loc_gdy', String(gdy));
        }
      }
      let infos = event.fingerInfos;
      if (infos !== undefined) {
        AppStorage.setOrCreate<string>('gesture_probe_tap_fingerinfos_len', String(infos.length));
        if (infos.length > 0) {
          let f0 = infos[0];
          if (f0.globalDisplayX !== undefined) {
            AppStorage.setOrCreate<string>('gesture_probe_tap_finger_gdx', String(f0.globalDisplayX));
          }
          if (f0.globalDisplayY !== undefined) {
            AppStorage.setOrCreate<string>('gesture_probe_tap_finger_gdy', String(f0.globalDisplayY));
          }
        }
      }
    };

    let tapChain: GestureType = TapGesture({ count: 1, fingers: 1 }).onAction(onTap);

    let onPanStart: Callback<GestureEvent> = (event: GestureEvent): void => {
      AppStorage.setOrCreate<string>('gesture_probe_pan_start', '1');
      AppStorage.setOrCreate<string>('gesture_probe_pan_cfg_dm_size', String(gesturePanDistanceMap().size));
      writePanRecognizerDistanceOrFallback(event);
      AppStorage.setOrCreate<string>('gesture_probe_pan_start_offset_x', String(event.offsetX));
      let pid = event.target.id;
      if (pid !== undefined && pid.length > 0) {
        AppStorage.setOrCreate<string>('gesture_probe_pan_target_id', pid);
      }
      let infos = event.fingerInfos;
      if (infos !== undefined) {
        AppStorage.setOrCreate<string>('gesture_probe_pan_start_fi_len', String(infos.length));
        if (infos.length > 0) {
          let f0 = infos[0];
          if (f0.globalDisplayX !== undefined) {
            AppStorage.setOrCreate<string>('gesture_probe_pan_fi_gdx', String(f0.globalDisplayX));
          }
          if (f0.globalDisplayY !== undefined) {
            AppStorage.setOrCreate<string>('gesture_probe_pan_fi_gdy', String(f0.globalDisplayY));
          }
        }
      }
    };

    let onPanUpdate: Callback<GestureEvent> = (event: GestureEvent): void => {
      AppStorage.setOrCreate<string>('gesture_probe_pan_update', '1');
      AppStorage.setOrCreate<string>('gesture_probe_pan_update_off_x', String(event.offsetX));
      let infos = event.fingerInfos;
      if (infos !== undefined && infos.length > 0) {
        let f0 = infos[0];
        if (f0.globalDisplayX !== undefined) {
          AppStorage.setOrCreate<string>('gesture_probe_pan_update_fi_gdx', String(f0.globalDisplayX));
        }
      }
    };

    let onPanEnd: Callback<GestureEvent> = (event: GestureEvent): void => {
      AppStorage.setOrCreate<string>('gesture_probe_pan_end', '1');
      AppStorage.setOrCreate<string>('gesture_probe_pan_end_off_x', String(event.offsetX));
    };

    let panChain: GestureType = PanGesture({
      fingers: 1,
      direction: PanDirection.Horizontal,
      distance: 1,
      distanceMap: gesturePanDistanceMap(),
    })
      .onActionStart(onPanStart)
      .onActionUpdate(onPanUpdate)
      .onActionEnd(onPanEnd);

    Column() {
      Text('gesture tap host')
        .fontSize(22)
        .id('gestureTapHost')
        .key('gestureTapHost')
        .gesture(tapChain, GestureMask.Normal);
      Text('gesture pan host')
        .fontSize(22)
        .width('90%')
        .height(180)
        .id('gesturePanHost')
        .key('gesturePanHost')
        .gesture(panChain, GestureMask.Normal);
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center);
  }
}
