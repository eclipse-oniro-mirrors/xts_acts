'use static'
import {
  NavPathInfo, TextAlign, ForEach, List, ListItem, HorizontalAlign, NavigationTransitionProxy,
  NavigationAnimatedTransition, NavContentInfo, Row, NavigationMenuItem, ToolbarItem, NavigationTitleMode,
  Navigation, NavigationMode, NavigationOperation, NavDestinationContext, NavPathStack, LengthMetrics, DividerMode,
  DividerStyleOptions, CancelButtonStyle, TextInput, AvoidanceMode, SelectAttribute, AttributeModifier, Text,
  TextAttribute, Column, Component, Button, ButtonAttribute, ClickEvent, Menu, Scroll, Scroller, MenuAttribute,
  MenuElement, Builder, MenuItem, MenuItemOptions, CustomBuilder, Color, ResponseType, Select, SelectOption,
  DividerOptions, Font, ResourceColor, Length, Offset, $r, OnSelectCallback, ArrowPosition, FontStyle, FontWeight,
  MenuAlignType, ControlSize, BlurStyle, Image, Resource, ResourceStr, OptionWidthMode, Dimension, Entry
} from '@ohos.arkui.component'
import { Provide, State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

export interface AnimateCallback {
  finish: (((isPush: boolean, isExit: boolean) => void) | undefined) | undefined;
  start: (((isPush: boolean, isExit: boolean) => void) | undefined) | undefined;
  onFinish: (((isPush: boolean, isExit: boolean) => void) | undefined) | undefined;
  interactive: (((operation: NavigationOperation) => void) | undefined) | undefined;
  timeout: (number | undefined) | undefined;
}

const customTransitionMap: Map<string, AnimateCallback> = new Map<string, AnimateCallback>();

export class CustomTransition {
  static delegate = new CustomTransition();
  interactive: boolean = false;
  proxy: NavigationTransitionProxy | undefined = undefined;
  private animationId: number = 0;
  operation: NavigationOperation = NavigationOperation.PUSH;

  static getInstance() {
    return CustomTransition.delegate;
  }

  /* 注册某个页面的动画回调
   * name: 注册页面的唯一id
   * startCallback：用来设置动画开始时页面的状态
   * endCallback：用来设置动画结束时页面的状态
   * onFinish：用来执行动画结束后页面的其他操作
   * interactiveCallback: 注册的可交互转场的动效
   * timeout：转场结束的超时时间
   */
  registerNavParam(name: string, startCallback: (operation: boolean, isExit: boolean) => void,
    endCallback: (operation: boolean, isExit: boolean) => void,
    onFinish: (operation: boolean, isExit: boolean) => void,
    interactiveCallback: (operation: NavigationOperation) => void,
    timeout: number): void {
    if (customTransitionMap.has(name)) {
      let param = customTransitionMap.get(name);
      if (param != undefined) {
        param.start = startCallback;
        param.finish = endCallback;
        param.timeout = timeout;
        param.onFinish = onFinish;
        param.interactive = interactiveCallback;
        return;
      }
    }
    let params: AnimateCallback = {
      timeout: timeout,
      start: startCallback,
      finish: endCallback,
      onFinish: onFinish,
      interactive: interactiveCallback
    };
    customTransitionMap.set(name, params);
  }

  getAnimationId() {
    return Date.now();
  }

  unRegisterNavParam(name: string): void {
    customTransitionMap.delete(name);
  }

  fireInteractiveAnimation(id: string, operation: NavigationOperation) {
    let animation = customTransitionMap.get(id)?.interactive;
    if (!animation) {
      return;
    }
    animation(operation);
  }

  updateProgress(progress: number) {
    if (!this.proxy?.updateTransition) {
      return;
    }
    progress = this.operation == NavigationOperation.PUSH ? 1 - progress : progress;
    this.proxy?.updateTransition?.(progress);
  }

  cancelTransition() {
    if (this.proxy?.cancelTransition) {
      this.proxy?.cancelTransition?.();
    }
  }

  recoverState() {
    if (!this.proxy?.from.navDestinationId || !this.proxy?.to.navDestinationId) {
      return;
    }
    let fromParam = customTransitionMap.get(this.proxy?.from.navDestinationId ?? 'default');
    if (fromParam?.onFinish) {
      fromParam?.onFinish?.(false, false);
    }
    let toParam = customTransitionMap.get(this.proxy?.to.navDestinationId ?? 'default');
    if (toParam?.onFinish) {
      toParam?.onFinish?.(true, true);
    }
  }

  finishTransition() {
    this.proxy?.finishTransition();
  }

  finishInteractiveAnimation(rate: number) {
    if (this.operation == NavigationOperation.PUSH) {
      if (rate > 0.5) {
        if (this.proxy?.cancelTransition) {
          this.proxy?.cancelTransition?.();
        }
      } else {
        this.proxy?.finishTransition();
      }
    } else {
      if (rate > 0.5) {
        this.proxy?.finishTransition();
      } else {
        if (this.proxy?.cancelTransition) {
          this.proxy?.cancelTransition?.();
        }
      }
    }
  }

  getAnimateParam(name: string): AnimateCallback {
    let result: AnimateCallback = {
      start: customTransitionMap.get(name)?.start,
      finish: customTransitionMap.get(name)?.finish,
      timeout: customTransitionMap.get(name)?.timeout,
      onFinish: customTransitionMap.get(name)?.onFinish,
      interactive: customTransitionMap.get(name)?.interactive,
    };
    return result;
  }
}