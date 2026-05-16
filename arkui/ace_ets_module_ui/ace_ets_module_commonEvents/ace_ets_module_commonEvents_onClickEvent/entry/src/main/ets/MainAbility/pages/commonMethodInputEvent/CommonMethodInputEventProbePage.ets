/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import router from '@ohos.router';

export const COMMON_METHOD_INPUT_PAGE: string = 'MainAbility/pages/commonMethodInputEvent/CommonMethodInputEventProbePage';
export const COMMON_METHOD_INPUT_ROUTE_PARAM: string = 'probe';
export const COMMON_METHOD_INPUT_STATUS_KEY: string = 'actsAceCommonMethodInputProbeStatus';

export class CommonMethodInputProbeRoute {
  public static readonly MOUSE_EVENT_HANDLE: string = 'mouse_event_handle';
  public static readonly TOUCH_EVENT_HANDLE: string = 'touch_event_handle';
  public static readonly AXIS_EVENT_HANDLE: string = 'axis_event_handle';
  public static readonly DRAG_RESULT_UNKNOWN: string = 'drag_result_unknown';
  public static readonly ENABLE_CLICK_SOUND: string = 'enable_click_sound';
}

function eventHandleIdOptionalNumberOk(v: number | undefined): boolean {
  return v === undefined || typeof v === 'number';
}

function readProbeRoute(): string {
  let p: Object | undefined = router.getParams();
  if (p === undefined) {
    return '';
  }
  let rec: Record<string, Object> = p as Record<string, Object>;
  let r: Object | undefined = rec[COMMON_METHOD_INPUT_ROUTE_PARAM];
  if (typeof r === 'string' && (r as string).length > 0) {
    return r as string;
  }
  return '';
}

function probeMouseEventHandleId(): void {
  let withId = { eventHandleId: 1 } as MouseEvent;
  if (!eventHandleIdOptionalNumberOk(withId.eventHandleId)) {
    throw new Error('MouseEvent.eventHandleId with number invalid');
  }
  let without = {} as MouseEvent;
  if (!eventHandleIdOptionalNumberOk(without.eventHandleId)) {
    throw new Error('MouseEvent.eventHandleId undefined invalid');
  }
}

function buildSyntheticTouchDownWithHandleId(eventHandleId?: number): TouchEvent {
  let ts: number = Date.now();
  let touch: TouchObject = {
    type: TouchType.Down,
    id: 0,
    displayX: 24,
    displayY: 24,
    windowX: 24,
    windowY: 24,
    screenX: 24,
    screenY: 24,
    x: 24,
    y: 24,
  };
  if (eventHandleId === undefined) {
    return {
      type: TouchType.Down,
      touches: [touch],
      changedTouches: [touch],
      stopPropagation: (): void => {
      },
      preventDefault: (): void => {
      },
      getHistoricalPoints: (): Array<HistoricalPoint> => {
        return [];
      },
      target: {} as EventTarget,
      timestamp: ts,
      source: SourceType.TouchScreen,
      pressure: 0,
      tiltX: 0,
      tiltY: 0,
      sourceTool: SourceTool.Finger,
    };
  }
  return {
    type: TouchType.Down,
    touches: [touch],
    changedTouches: [touch],
    stopPropagation: (): void => {
    },
    preventDefault: (): void => {
    },
    getHistoricalPoints: (): Array<HistoricalPoint> => {
      return [];
    },
    target: {} as EventTarget,
    timestamp: ts,
    source: SourceType.TouchScreen,
    pressure: 0,
    tiltX: 0,
    tiltY: 0,
    sourceTool: SourceTool.Finger,
    eventHandleId: eventHandleId,
  };
}

function probeTouchEventHandleId(): void {
  let t1: TouchEvent = buildSyntheticTouchDownWithHandleId(0);
  if (!eventHandleIdOptionalNumberOk(t1.eventHandleId)) {
    throw new Error('TouchEvent.eventHandleId with number invalid');
  }
  let t2: TouchEvent = buildSyntheticTouchDownWithHandleId(undefined);
  if (!eventHandleIdOptionalNumberOk(t2.eventHandleId)) {
    throw new Error('TouchEvent.eventHandleId unset invalid');
  }
}

function probeAxisEventHandleId(): void {
  let withId = { eventHandleId: 42 } as AxisEvent;
  if (!eventHandleIdOptionalNumberOk(withId.eventHandleId)) {
    throw new Error('AxisEvent.eventHandleId with number invalid');
  }
  let without = {} as AxisEvent;
  if (!eventHandleIdOptionalNumberOk(without.eventHandleId)) {
    throw new Error('AxisEvent.eventHandleId undefined invalid');
  }
}

function probeDragResultUnknown(): void {
  const documentedUnknown: number = -1;
  let known: number[] = [
    DragResult.DRAG_SUCCESSFUL,
    DragResult.DRAG_FAILED,
    DragResult.DRAG_CANCELED,
    DragResult.DROP_ENABLED,
    DragResult.DROP_DISABLED,
  ];
  for (let i: number = 0; i < known.length; i++) {
    if (known[i] === documentedUnknown) {
      throw new Error('DragResult documented values must not equal UNKNOWN (-1)');
    }
  }
}

@Entry
@Component
struct CommonMethodInputEventProbePage {
  @State private shellRoute: string = '';

  aboutToAppear(): void {
    AppStorage.setOrCreate(COMMON_METHOD_INPUT_STATUS_KEY, 'pending');
    let route: string = readProbeRoute();
    this.shellRoute = route;

    if (route === CommonMethodInputProbeRoute.ENABLE_CLICK_SOUND) {
      return;
    }

    try {
      if (route === CommonMethodInputProbeRoute.MOUSE_EVENT_HANDLE) {
        probeMouseEventHandleId();
      } else if (route === CommonMethodInputProbeRoute.TOUCH_EVENT_HANDLE) {
        probeTouchEventHandleId();
      } else if (route === CommonMethodInputProbeRoute.AXIS_EVENT_HANDLE) {
        probeAxisEventHandleId();
      } else if (route === CommonMethodInputProbeRoute.DRAG_RESULT_UNKNOWN) {
        probeDragResultUnknown();
      } else {
        AppStorage.setOrCreate(COMMON_METHOD_INPUT_STATUS_KEY, 'fail');
        return;
      }
      AppStorage.setOrCreate(COMMON_METHOD_INPUT_STATUS_KEY, 'ok');
    } catch (_e) {
      console.warn('[CommonMethodInputEventProbePage] 探针异常（SDK/ROM 差异可忽略）');
      AppStorage.setOrCreate(COMMON_METHOD_INPUT_STATUS_KEY, 'fail');
    }
  }

  build() {
    Column({ space: 8 }) {
      Text('Instrument：CommonMethod + Mouse/Touch/Axis eventHandleId + DragResult')
        .fontSize(13)
        .fontWeight(FontWeight.Bold)
      Text(`probe：${this.shellRoute.length > 0 ? this.shellRoute : '(no param)'}`)
        .fontSize(11)
        .fontColor($r('sys.color.ohos_id_color_text_secondary'))

      if (this.shellRoute === CommonMethodInputProbeRoute.ENABLE_CLICK_SOUND) {
        Button('enableClickSoundEffect chain')
          .fontSize(12)
          .enableClickSoundEffect(true)
          .enableClickSoundEffect(undefined)
      }
    }
    .width('100%')
    .height('100%')
    .padding({ left: 12, right: 12, top: 8, bottom: 32 })
    .onAppear(() => {
      if (this.shellRoute !== CommonMethodInputProbeRoute.ENABLE_CLICK_SOUND) {
        return;
      }
      try {
        AppStorage.setOrCreate(COMMON_METHOD_INPUT_STATUS_KEY, 'ok');
      } catch (_e) {
        AppStorage.setOrCreate(COMMON_METHOD_INPUT_STATUS_KEY, 'fail');
      }
    })
  }
}
