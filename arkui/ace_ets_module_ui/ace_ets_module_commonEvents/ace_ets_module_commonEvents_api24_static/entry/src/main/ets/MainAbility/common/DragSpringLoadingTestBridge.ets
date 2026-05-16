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

import dragController from '@ohos.arkui.dragController';

/**
 * 探针与 Hypium 共用的最小结构：与 SpringLoadingContext 在 BEGIN 下实际读写字段一致，
 * 避免测试替身向 native SpringLoadingContext 强转（ESE0326）。
 */
export interface SpringLoadingContextForBridge {
  state: dragController.DragSpringLoadingState;
  currentNotifySequence: int;
  dragInfos?: dragController.SpringLoadingDragInfos;
  currentConfig?: dragController.DragSpringLoadingConfiguration;
  abort(): void;
  updateConfiguration(c: dragController.DragSpringLoadingConfiguration): void;
}

/**
 * Captures SpringLoadingContext callbacks from onDragSpringLoading for Hypium tests.
 * See: js-apis-arkui-dragController / onDragSpringLoading.
 */
export class DragSpringLoadingTestBridge {
  public static scenario: int = 0;
  public static callbackCount: int = 0;
  /** 探针 onDragStart 被调用次数（能区分注入是否触发了拖拽开始）。 */
  public static dragStartCount: int = 0;
  public static beginState: dragController.DragSpringLoadingState = dragController.DragSpringLoadingState.BEGIN;
  public static beginSequence: int = -1;
  public static abortAfterBeginCount: int = 0;
  public static updateConfigurationExecuted: boolean = false;
  public static beginDragInfosDefined: boolean = false;
  public static beginConfigStillMs: int = -1;

  static reset(scenario: int): void {
    DragSpringLoadingTestBridge.scenario = scenario;
    DragSpringLoadingTestBridge.callbackCount = 0;
    DragSpringLoadingTestBridge.dragStartCount = 0;
    DragSpringLoadingTestBridge.beginSequence = -1;
    DragSpringLoadingTestBridge.abortAfterBeginCount = 0;
    DragSpringLoadingTestBridge.updateConfigurationExecuted = false;
    DragSpringLoadingTestBridge.beginDragInfosDefined = false;
    DragSpringLoadingTestBridge.beginConfigStillMs = -1;
  }

  static recordDragStart(extraParams?: string): void {
    DragSpringLoadingTestBridge.dragStartCount = DragSpringLoadingTestBridge.dragStartCount + 1;
    console.info('[SpringProbe] onDragStart invoke=' + DragSpringLoadingTestBridge.dragStartCount +
      ' extraParamsLen=' + (extraParams !== undefined ? extraParams.length : 0));
  }

  static logSnapshot(where: string): void {
    console.info('[SpringBridge] snapshot ' + where +
      ' dragStart=' + DragSpringLoadingTestBridge.dragStartCount +
      ' springCb=' + DragSpringLoadingTestBridge.callbackCount +
      ' beginSeq=' + DragSpringLoadingTestBridge.beginSequence +
      ' stillMs=' + DragSpringLoadingTestBridge.beginConfigStillMs +
      ' abortN=' + DragSpringLoadingTestBridge.abortAfterBeginCount +
      ' updateCfg=' + DragSpringLoadingTestBridge.updateConfigurationExecuted);
  }

  static onSpringLoading(ctx: SpringLoadingContextForBridge): void {
    console.info('[SpringBridge] onSpringLoading state=' + ctx.state +
      ' seq=' + ctx.currentNotifySequence +
      ' stillLimit=' + (ctx.currentConfig?.stillTimeLimit ?? -1));
    DragSpringLoadingTestBridge.callbackCount = DragSpringLoadingTestBridge.callbackCount + 1;
    if (ctx.state === dragController.DragSpringLoadingState.BEGIN) {
      DragSpringLoadingTestBridge.beginState = ctx.state;
      DragSpringLoadingTestBridge.beginSequence = ctx.currentNotifySequence;
      DragSpringLoadingTestBridge.beginDragInfosDefined = ctx.dragInfos !== undefined;
      DragSpringLoadingTestBridge.beginConfigStillMs = ctx.currentConfig?.stillTimeLimit ?? -1;
      if (DragSpringLoadingTestBridge.scenario === 0) {
        ctx.abort();
        DragSpringLoadingTestBridge.abortAfterBeginCount = DragSpringLoadingTestBridge.abortAfterBeginCount + 1;
      } else {
        ctx.updateConfiguration({ stillTimeLimit: 77, updateInterval: 33 });
        DragSpringLoadingTestBridge.updateConfigurationExecuted = true;
        ctx.abort();
        DragSpringLoadingTestBridge.abortAfterBeginCount = DragSpringLoadingTestBridge.abortAfterBeginCount + 1;
      }
    }
  }
}
