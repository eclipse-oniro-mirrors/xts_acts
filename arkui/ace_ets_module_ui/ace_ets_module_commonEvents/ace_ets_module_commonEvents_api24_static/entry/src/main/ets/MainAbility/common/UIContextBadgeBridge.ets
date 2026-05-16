'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 */

import { DragController, UIContext } from '@ohos.arkui.UIContext';

/**
 * enableDropDisallowedBadge 挂在 UIContext.getDragController() 返回的 DragController 上
 * （@ohos.arkui.UIContext.DragController），不是 UIContext 本身；勿对 UIContext 做接口强转。
 */
export function invokeEnableDropDisallowedBadgeTrueThenFalse(ctx: UIContext): void {
  let dragCtl: DragController = ctx.getDragController();
  dragCtl.enableDropDisallowedBadge(true);
  dragCtl.enableDropDisallowedBadge(false);
}
