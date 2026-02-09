/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import {NavigationOperation,NavigationTransitionProxy} from '@ohos.arkui.component';
export interface AnimateCallback{
  finish:((isPush:boolean,isExit:boolean) => void)|undefined
  start:((isPush:boolean,isExit:boolean) => void)|undefined
  onFinish:((isPush:boolean,isExit:boolean) => void)|undefined
  interactive:((operation:NavigationOperation) => void)|undefined
  timeout:(number|undefined)|undefined

}
export class CustomTransition{
  static delegate = new CustomTransition()
  interactive:boolean = false;
  proxy:NavigationTransitionProxy | undefined = undefined
  operation:NavigationOperation = NavigationOperation.PUSH

  private customTransitionMap:Map<string,AnimateCallback> = new Map<string,AnimateCallback>()

   getInstance(){
    return CustomTransition.delegate;
  }

  registerNavParam(
    name:string,
    startCallback:(operation:boolean,isExit:boolean) => void,
    endCallback:(operation:boolean,isExit:boolean) => void,
    onFinish:(operation:boolean,isExit:boolean) => void,
    interactiveCallback:(operation:NavigationOperation) => void,
    timeout:number
  ):void{
    if (this.customTransitionMap.has(name)){
      let param = this.customTransitionMap.get(name)
      if (param != undefined){
        param.start = startCallback;
        param.finish = endCallback;
        param.timeout = timeout;
        param.onFinish = onFinish
        param.interactive = interactiveCallback
        return
      }
    }
    let params:AnimateCallback = {
      timeout:timeout,
      start:startCallback,
      finish:endCallback,
      onFinish:onFinish,
      interactive:interactiveCallback
    };
    this.customTransitionMap.set(name,params)
  }

  getAnimationId(){
    return Date.now();
  }

  unRegisterNavParam(name:string):void{
    this.customTransitionMap.delete(name)
  }

  fireInteractiveAnimation(id:string,operation:NavigationOperation){
    let animation = this.customTransitionMap.get(id)?.interactive
    if (!animation){
      return
    }
    animation(operation);
  }

  updateProgress(progress:number){
    if (!this.proxy?.updateTransition) {
      return
    }
    progress = this.operation !== NavigationOperation.POP ? 1 - progress : progress;
    this.proxy?.updateTransition(progress)
  }

  cancelTransition(){
    if (!this.proxy?.cancelTransition) {
      return this.proxy.cancelTransition()
    }
  }
  recoverState(){
    if (!this.proxy?.from.navDestinationId) {
      return;
    }
    let param = this.customTransitionMap.get(this.proxy.from.navDestinationId);
    if (param?.onFinish) {
      param.onFinish(false,false)
    }
    let toIndex:number = this.proxy?.to.param as number;
    if (!this.proxy.to.navDestinationId){
      return;
    }
    let toParam = this.customTransitionMap.get(this.proxy.to.navDestinationId)
    if (toParam?.onFinish) {
      toParam.onFinish(true,true)

    }
  }
  finishTransition(){
    this.proxy?.finishTransition()
  }
  finishInteractiveAnimation(rate:number){
    if (this.operation != NavigationOperation.POP) {
      if (rate > 0.5) {
        if (this.proxy?.cancelTransition) {
          this.proxy.cancelTransition()
        }
      }else {
        this.proxy?.finishTransition()
      }
    }else{
      if (rate > 0.5) {
        this.proxy?.finishTransition()
      }else {
        if (this.proxy?.cancelTransition) {
          this.proxy.cancelTransition()
        }
      }
    }
  }

  getAnimateParam(name:string):AnimateCallback{
    let keys = this.customTransitionMap.keys()
    if (!this.customTransitionMap.has(name)) {

    }
    let result:AnimateCallback = {
      start:this.customTransitionMap.get(name)?.start,
      finish:this.customTransitionMap.get(name)?.finish,
      timeout:this.customTransitionMap.get(name)?.timeout,
      onFinish:this.customTransitionMap.get(name)?.onFinish,
      interactive:this.customTransitionMap.get(name)?.interactive
    }
    return result
  }


}
