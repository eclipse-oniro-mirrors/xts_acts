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

import common from '@ohos.app.ability.common';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  build() {

    Scroll(){
      Column() {
        Text('单个启动框架')
          .fontSize('30px')
          .fontWeight(FontWeight.Bold)
          .border({
            color:'#333',
            width:'1px',
            radius:'20'
          })
          .padding({top: '10px', right: '10px', bottom: '10px', left:'10px'})
          .margin({bottom:'10px'})
          .onClick(()=>{
            let context = getContext(this) as common.UIAbilityContext;
            context.startAbility({
              abilityName: 'SingleStartAbility',
              bundleName:'com.acts.startupmanualhelp1',
              parameters:{
                keepAlive:true
              }
            })
          })

        Text('多层依赖启动')
          .fontSize('30px')
          .fontWeight(FontWeight.Bold)
          .border({
            color:'#333',
            width:'1px',
            radius:'20'
          })
          .padding({top: '10px', right: '10px', bottom: '10px', left:'10px'})
          .margin({bottom:'10px'})
          .onClick(()=>{
            let context = getContext(this) as common.UIAbilityContext;
            context.startAbility({
              abilityName: 'PageAbility2',
              bundleName:'com.acts.startupmanualhelp1',
              parameters:{
                keepAlive:true
              }
            })
          })

        Text('分叉依赖启动')
          .fontSize('30px')
          .fontWeight(FontWeight.Bold)
          .border({
            color:'#333',
            width:'1px',
            radius:'20'
          })
          .padding({top: '10px', right: '10px', bottom: '10px', left:'10px'})
          .margin({bottom:'10px'})
          .onClick(()=>{
            let context = getContext(this) as common.UIAbilityContext;
            context.startAbility({
              abilityName: 'PageAbility3',
              bundleName:'com.acts.startupmanualhelp1',
              parameters:{
                keepAlive:true
              }
            })
          })

        Text('多层循环依赖启动')
          .fontSize('30px')
          .fontWeight(FontWeight.Bold)
          .border({
            color:'#333',
            width:'1px',
            radius:'20'
          })
          .padding({top: '10px', right: '10px', bottom: '10px', left:'10px'})
          .margin({bottom:'10px'})
          .onClick(()=>{
            let context = getContext(this) as common.UIAbilityContext;
            context.startAbility({
              abilityName: 'PageAbility4',
              bundleName:'com.acts.startupmanualhelp1',
              parameters:{
                keepAlive:true
              }
            })
          })

        Text('分叉循环依赖启动')
          .fontSize('30px')
          .fontWeight(FontWeight.Bold)
          .border({
            color:'#333',
            width:'1px',
            radius:'20'
          })
          .padding({top: '10px', right: '10px', bottom: '10px', left:'10px'})
          .margin({bottom:'10px'})
          .onClick(()=>{
            let context = getContext(this) as common.UIAbilityContext;
            context.startAbility({
              abilityName: 'PageAbility5',
              bundleName:'com.acts.startupmanualhelp1',
              parameters:{
                keepAlive:true
              }
            })
          })

        Text('多层依赖启动，收到依赖加载成功的回调')
          .fontSize('30px')
          .fontWeight(FontWeight.Bold)
          .border({
            color:'#333',
            width:'1px',
            radius:'20'
          })
          .padding({top: '10px', right: '10px', bottom: '10px', left:'10px'})
          .margin({bottom:'10px'})
          .onClick(()=>{
            let context = getContext(this) as common.UIAbilityContext;
            context.startAbility({
              abilityName: 'PageAbility6',
              bundleName:'com.acts.startupmanualhelp1',
              parameters:{
                keepAlive:true
              }
            })
          })

        Text('分叉依赖启动，收到依赖加载成功的回调')
          .fontSize('30px')
          .fontWeight(FontWeight.Bold)
          .border({
            color:'#333',
            width:'1px',
            radius:'20'
          })
          .padding({top: '10px', right: '10px', bottom: '10px', left:'10px'})
          .margin({bottom:'10px'})
          .onClick(()=>{
            let context = getContext(this) as common.UIAbilityContext;
            context.startAbility({
              abilityName: 'PageAbility7',
              bundleName:'com.acts.startupmanualhelp1',
              parameters:{
                keepAlive:true
              }
            })
          })

        Text('单个启动，不收到依赖加载成功的回调')
          .fontSize('30px')
          .fontWeight(FontWeight.Bold)
          .border({
            color:'#333',
            width:'1px',
            radius:'20'
          })
          .padding({top: '10px', right: '10px', bottom: '10px', left:'10px'})
          .margin({bottom:'10px'})
          .onClick(()=>{
            let context = getContext(this) as common.UIAbilityContext;
            context.startAbility({
              abilityName: 'SingleStartAbility2',
              bundleName:'com.acts.startupmanualhelp1',
              parameters:{
                keepAlive:true
              }
            })
          })

        Text('线程等待回调，回调执行后查询加载成功')
          .fontSize('30px')
          .fontWeight(FontWeight.Bold)
          .border({
            color:'#333',
            width:'1px',
            radius:'20'
          })
          .padding({top: '10px', right: '10px', bottom: '10px', left:'10px'})
          .margin({bottom:'10px'})
          .onClick(()=>{
            let context = getContext(this) as common.UIAbilityContext;
            context.startAbility({
              abilityName: 'PageAbility8',
              bundleName:'com.acts.startupmanualhelp1',
              parameters:{
                keepAlive:true
              }
            })
          })

        Text('线程不等待回调，回调执行后查询加载失败')
          .fontSize('30px')
          .fontWeight(FontWeight.Bold)
          .border({
            color:'#333',
            width:'1px',
            radius:'20'
          })
          .padding({top: '10px', right: '10px', bottom: '10px', left:'10px'})
          .margin({bottom:'10px'})
          .onClick(()=>{
            let context = getContext(this) as common.UIAbilityContext;
            context.startAbility({
              abilityName: 'PageAbility9',
              bundleName:'com.acts.startupmanualhelp1',
              parameters:{
                keepAlive:true
              }
            })
          })

        Text('自定义配置单个启动框架')
          .fontSize('30px')
          .fontWeight(FontWeight.Bold)
          .border({
            color:'#333',
            width:'1px',
            radius:'20'
          })
          .padding({top: '10px', right: '10px', bottom: '10px', left:'10px'})
          .margin({bottom:'10px'})
          .onClick(()=>{
            let context = getContext(this) as common.UIAbilityContext;
            context.startAbility({
              abilityName: 'SingleStartAbility',
              bundleName:'com.acts.startupmanualhelp1',
              parameters:{
                keepAlive:true,
                defaultConfig:true
              }
            })
          })

        Text('自定义配置多层依赖启动')
          .fontSize('30px')
          .fontWeight(FontWeight.Bold)
          .border({
            color:'#333',
            width:'1px',
            radius:'20'
          })
          .padding({top: '10px', right: '10px', bottom: '10px', left:'10px'})
          .margin({bottom:'10px'})
          .onClick(()=>{
            let context = getContext(this) as common.UIAbilityContext;
            context.startAbility({
              abilityName: 'PageAbility2',
              bundleName:'com.acts.startupmanualhelp1',
              parameters:{
                keepAlive:true,
                defaultConfig:true
              }
            })
          })

        Text('自定义配置分叉依赖启动')
          .fontSize('30px')
          .fontWeight(FontWeight.Bold)
          .border({
            color:'#333',
            width:'1px',
            radius:'20'
          })
          .padding({top: '10px', right: '10px', bottom: '10px', left:'10px'})
          .margin({bottom:'10px'})
          .onClick(()=>{
            let context = getContext(this) as common.UIAbilityContext;
            context.startAbility({
              abilityName: 'PageAbility3',
              bundleName:'com.acts.startupmanualhelp1',
              parameters:{
                keepAlive:true,
                defaultConfig:true
              }
            })
          })

        Text('自定义配置多层循环依赖启动')
          .fontSize('30px')
          .fontWeight(FontWeight.Bold)
          .border({
            color:'#333',
            width:'1px',
            radius:'20'
          })
          .padding({top: '10px', right: '10px', bottom: '10px', left:'10px'})
          .margin({bottom:'10px'})
          .onClick(()=>{
            let context = getContext(this) as common.UIAbilityContext;
            context.startAbility({
              abilityName: 'PageAbility4',
              bundleName:'com.acts.startupmanualhelp1',
              parameters:{
                keepAlive:true,
                defaultConfig:true
              }
            })
          })

        Text('自定义配置分叉循环依赖启动')
          .fontSize('30px')
          .fontWeight(FontWeight.Bold)
          .border({
            color:'#333',
            width:'1px',
            radius:'20'
          })
          .padding({top: '10px', right: '10px', bottom: '10px', left:'10px'})
          .margin({bottom:'10px'})
          .onClick(()=>{
            let context = getContext(this) as common.UIAbilityContext;
            context.startAbility({
              abilityName: 'PageAbility5',
              bundleName:'com.acts.startupmanualhelp1',
              parameters:{
                keepAlive:true,
                defaultConfig:true
              }
            })
          })

        Text('自定义配置，多层依赖启动，收到依赖加载成功的回调')
          .fontSize('30px')
          .fontWeight(FontWeight.Bold)
          .border({
            color:'#333',
            width:'1px',
            radius:'20'
          })
          .padding({top: '10px', right: '10px', bottom: '10px', left:'10px'})
          .margin({bottom:'10px'})
          .onClick(()=>{
            let context = getContext(this) as common.UIAbilityContext;
            context.startAbility({
              abilityName: 'PageAbility6',
              bundleName:'com.acts.startupmanualhelp1',
              parameters:{
                keepAlive:true,
                defaultConfig:true
              }
            })
          })

        Text('自定义配置，分叉依赖启动，收到依赖加载成功的回调')
          .fontSize('30px')
          .fontWeight(FontWeight.Bold)
          .border({
            color:'#333',
            width:'1px',
            radius:'20'
          })
          .padding({top: '10px', right: '10px', bottom: '10px', left:'10px'})
          .margin({bottom:'10px'})
          .onClick(()=>{
            let context = getContext(this) as common.UIAbilityContext;
            context.startAbility({
              abilityName: 'PageAbility7',
              bundleName:'com.acts.startupmanualhelp1',
              parameters:{
                keepAlive:true,
                defaultConfig:true
              }
            })
          })

        Text('自定义配置，单个启动，不收到依赖加载成功的回调')
          .fontSize('30px')
          .fontWeight(FontWeight.Bold)
          .border({
            color:'#333',
            width:'1px',
            radius:'20'
          })
          .padding({top: '10px', right: '10px', bottom: '10px', left:'10px'})
          .margin({bottom:'10px'})
          .onClick(()=>{
            let context = getContext(this) as common.UIAbilityContext;
            context.startAbility({
              abilityName: 'SingleStartAbility2',
              bundleName:'com.acts.startupmanualhelp1',
              parameters:{
                keepAlive:true,
                defaultConfig:true
              }
            })
          })

        Text('自定义配置，线程等待回调，回调执行后查询加载成功')
          .fontSize('30px')
          .fontWeight(FontWeight.Bold)
          .border({
            color:'#333',
            width:'1px',
            radius:'20'
          })
          .padding({top: '10px', right: '10px', bottom: '10px', left:'10px'})
          .margin({bottom:'10px'})
          .onClick(()=>{
            let context = getContext(this) as common.UIAbilityContext;
            context.startAbility({
              abilityName: 'PageAbility8',
              bundleName:'com.acts.startupmanualhelp1',
              parameters:{
                keepAlive:true,
                defaultConfig:true
              }
            })
          })

        Text('自定义配置，线程不等待回调，回调执行后查询加载失败')
          .fontSize('30px')
          .fontWeight(FontWeight.Bold)
          .border({
            color:'#333',
            width:'1px',
            radius:'20'
          })
          .padding({top: '10px', right: '10px', bottom: '10px', left:'10px'})
          .margin({bottom:'10px'})
          .onClick(()=>{
            let context = getContext(this) as common.UIAbilityContext;
            context.startAbility({
              abilityName: 'PageAbility9',
              bundleName:'com.acts.startupmanualhelp1',
              parameters:{
                keepAlive:true,
                defaultConfig:true
              }
            })
          })

        Text('run with undefined')
          .fontSize('30px')
          .fontWeight(FontWeight.Bold)
          .border({
            color:'#333',
            width:'1px',
            radius:'20'
          })
          .padding({top: '10px', right: '10px', bottom: '10px', left:'10px'})
          .margin({bottom:'10px'})
          .onClick(()=>{
            let context = getContext(this) as common.UIAbilityContext;
            context.startAbility({
              abilityName: 'PageAbility10',
              bundleName:'com.acts.startupmanualhelp1',
              parameters:{
                keepAlive:true,
                type: 0//undefined
              }
            })
          })

        Text('run with null')
          .fontSize('30px')
          .fontWeight(FontWeight.Bold)
          .border({
            color:'#333',
            width:'1px',
            radius:'20'
          })
          .padding({top: '10px', right: '10px', bottom: '10px', left:'10px'})
          .margin({bottom:'10px'})
          .onClick(()=>{
            let context = getContext(this) as common.UIAbilityContext;
            context.startAbility({
              abilityName: 'PageAbility10',
              bundleName:'com.acts.startupmanualhelp1',
              parameters:{
                keepAlive:true,
                type: 1//null
              }
            })
          })

        Text('run with []')
          .fontSize('30px')
          .fontWeight(FontWeight.Bold)
          .border({
            color:'#333',
            width:'1px',
            radius:'20'
          })
          .padding({top: '10px', right: '10px', bottom: '10px', left:'10px'})
          .margin({bottom:'10px'})
          .onClick(()=>{
            let context = getContext(this) as common.UIAbilityContext;
            context.startAbility({
              abilityName: 'PageAbility10',
              bundleName:'com.acts.startupmanualhelp1',
              parameters:{
                keepAlive:true,
                type: 2//undefined
              }
            })
          })

        Text('run with {}')
          .fontSize('30px')
          .fontWeight(FontWeight.Bold)
          .border({
            color:'#333',
            width:'1px',
            radius:'20'
          })
          .padding({top: '10px', right: '10px', bottom: '10px', left:'10px'})
          .margin({bottom:'10px'})
          .onClick(()=>{
            let context = getContext(this) as common.UIAbilityContext;
            context.startAbility({
              abilityName: 'PageAbility10',
              bundleName:'com.acts.startupmanualhelp1',
              parameters:{
                keepAlive:true,
                type: 3//undefined
              }
            })
          })

        Text('run with error startup, name is Sample_100')
          .fontSize('30px')
          .fontWeight(FontWeight.Bold)
          .border({
            color:'#333',
            width:'1px',
            radius:'20'
          })
          .padding({top: '10px', right: '10px', bottom: '10px', left:'10px'})
          .margin({bottom:'10px'})
          .onClick(()=>{
            let context = getContext(this) as common.UIAbilityContext;
            context.startAbility({
              abilityName: 'PageAbility10',
              bundleName:'com.acts.startupmanualhelp1',
              parameters:{
                keepAlive:true,
                type: 4//undefined
              }
            })
          })

        Text('api test')
          .fontSize('30px')
          .fontWeight(FontWeight.Bold)
          .border({
            color:'#333',
            width:'1px',
            radius:'20'
          })
          .padding({top: '10px', right: '10px', bottom: '10px', left:'10px'})
          .margin({bottom:'10px'})
          .onClick(()=>{
            let context = getContext(this) as common.UIAbilityContext;
            context.startAbility({
              abilityName: 'PageAbility11',
              bundleName:'com.acts.startupmanualhelp1',
              parameters:{
                keepAlive:true,
                type: 4//undefined
              }
            })
          })
      }
      .width('100%')
      .alignItems(HorizontalAlign.Center)
      .justifyContent(FlexAlign.Start)
    }
    .height('100%')
    .width('100%')
  }
}