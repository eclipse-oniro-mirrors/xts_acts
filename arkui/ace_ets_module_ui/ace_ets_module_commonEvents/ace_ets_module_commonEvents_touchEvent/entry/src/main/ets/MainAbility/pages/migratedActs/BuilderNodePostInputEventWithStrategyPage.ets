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
import { BuilderNode } from '@kit.ArkUI';
import { UIContext } from '@ohos.arkui.UIContext';

export const BUILDER_NODE_POST_INPUT_PAGE: string =
  'MainAbility/pages/migratedActs/BuilderNodePostInputEventWithStrategyPage';
export const BUILDER_NODE_POST_INPUT_STATUS_KEY: string = 'actsAceBuilderNodePostInputStrategyStatus';
export const BUILDER_NODE_POST_INPUT_RETURN_KEY: string = 'actsAceBuilderNodePostInputStrategyReturn';

@Builder
function buildBuilderNodePostInputProbeRoot() {
  Column() {
    Text('BuilderNode.postInputEventWithStrategy')
      .fontSize(12)
  }
  .width(220)
  .height(100)
}

function buildSyntheticTouchDownEvent(): TouchEvent {
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

function invokeBuilderNodePostInputEventWithStrategy(
  builderNode: BuilderNode<Object[]>,
  inputEvent: TouchEvent,
  competitionStrategy: CompetitionStrategy
): boolean {
  return builderNode.postInputEventWithStrategy(inputEvent, competitionStrategy);
}

@Entry
@Component
struct BuilderNodePostInputEventWithStrategyPage {
  aboutToAppear(): void {
    AppStorage.setOrCreate(BUILDER_NODE_POST_INPUT_STATUS_KEY, 'pending');
    try {
      let uiContext: UIContext = this.getUIContext();
      let builderNode: BuilderNode<Object[]> =
        new BuilderNode(uiContext, { selfIdealSize: { width: 240, height: 120 } });
      builderNode.build(wrapBuilder(buildBuilderNodePostInputProbeRoot));

      let inputEvent: TouchEvent = buildSyntheticTouchDownEvent();
      let postedOk: boolean = invokeBuilderNodePostInputEventWithStrategy(
        builderNode,
        inputEvent,
        CompetitionStrategy.DEFAULT);

      AppStorage.setOrCreate(BUILDER_NODE_POST_INPUT_RETURN_KEY, postedOk);
      AppStorage.setOrCreate(BUILDER_NODE_POST_INPUT_STATUS_KEY, 'ok');
    } catch (_e) {
      console.warn('[BuilderNodePostInputWithStrategy] BuilderNode / postInputEventWithStrategy exception (weak env)');
      AppStorage.setOrCreate(BUILDER_NODE_POST_INPUT_STATUS_KEY, 'fail');
    }
  }

  build() {
    Column({ space: 8 }) {
      Text('Instrument：BuilderNode.postInputEventWithStrategy')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
      Text('Route: MainAbility/pages/migratedActs/BuilderNodePostInputEventWithStrategyPage')
        .fontSize(11)
        .fontColor($r('sys.color.ohos_id_color_text_secondary'))
    }
    .width('100%')
    .height('100%')
    .padding({ left: 12, right: 12, top: 8, bottom: 32 })
  }
}
