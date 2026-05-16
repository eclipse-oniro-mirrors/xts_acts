/**
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

 import { UIUtils, IReusableInfo } from '@kit.ArkUI';


@ReusableV2
@ComponentV2
struct LegacyComp {
  aboutToAppear() {
    console.info('LegacyComp aboutToAppear');
  }

  aboutToReuse() {
    console.info('LegacyComp aboutToReuse');
  }

  aboutToRecycle() {
    console.info('LegacyComp aboutToRecycle');
  }

  aboutToDisappear() {
    console.info('LegacyComp aboutToDisappear');
  }

  build() {
    Column() {
      Text('传统组件')
      ReusableChild()
    }
  }
}

@ReusableV2
@ComponentV2
struct ReusableChild {
  @Consumer() provide: number = 10;

  aboutToAppear() {
    console.info('ReusableChild aboutToAppear');
  }

  aboutToReuse() {
    console.info('ReusableChild aboutToReuse');
  }

  aboutToRecycle() {
    console.info('ReusableChild aboutToRecycle');
  }

  aboutToDisappear() {
    console.info('ReusableChild aboutToDisappear');
  }

  build() {
    Text(`ReusableChild @Consumer: ${this.provide}`)
      .height('5%')
  }
}

@ReusableV2
@ComponentV2({ reusePool: 'shared', poolAccepts: ['ReusableChild'], freezeWhenInactive: false })
struct SubChild {
  @Consumer() provide: number = 10;

  aboutToAppear() {
    console.info('SubChild aboutToAppear');
  }

  aboutToReuse() {
    console.info('SubChild aboutToReuse');
  }

  aboutToRecycle() {
    console.info('SubChild aboutToRecycle');
  }

  aboutToDisappear() {
    console.info('SubChild aboutToDisappear');
  }

  build() {
    Text(`SubChild @Consumer: ${this.provide}`).height('5%')
  }
}
@Builder
function preRenderBuilder() {
  SubChild()
}
@ReusableV2
@ComponentV2({ reusePool: 'shared', poolAccepts: ['SubChild'], freezeWhenInactive: false })
struct GlobalChild {
  @Consumer() provide: number = 10;
  aboutToAppear() {
    console.info('GlobalChild aboutToAppear');
    const pool = UIUtils.getCustomComponentContext(this).getReusePool();
    console.info('www:s' , pool);
    const info = pool?.getReusableInfo(LegacyComp) as IReusableInfo | undefined;
    AppStorage.setOrCreate('getReusableInfoUndefined', info)

  }

  aboutToReuse() {
    console.info('GlobalChild aboutToReuse');
  }

  aboutToRecycle() {
    console.info('GlobalChild aboutToRecycle');
  }

  aboutToDisappear() {
    console.info('GlobalChild aboutToDisappear');
  }

  build() {
    Column({ space: 20 }) {
      Text('全局子组件').height('5%')
      SubChild()
    }
  }
}


@Entry
@ComponentV2({
  reusePool: 'perInstance',
  poolAccepts: ['LegacyComp', 'GlobalChild', 'ReusableChild', 'SubChild'],
  freezeWhenInactive: false
})
struct GlobalReusePool {
  @Provider() provide: number = 100;
  @Local boolVal: boolean = true;
  @Local flagShow: boolean = true;
  @Local onUIFullyLoaded: boolean = false;

  aboutToAppear(): void {
    const pool = UIUtils.getCustomComponentContext(this).getReusePool();
    pool!.preRender(wrapBuilder(preRenderBuilder), 1)
      .then(() => {
        this.onUIFullyLoaded = true;
      });
  }
  verifyPool(compName: string, comp: Function) {
    const pool = UIUtils.getCustomComponentContext(this).getReusePool();
    AppStorage.setOrCreate('getReusePoolNotUndefined', pool)
    if (!pool) {
      console.info('未找到池');
      return;
    }
    const ret = pool.getReusableInfo(comp);

    if (ret === undefined) {
      console.info(`getReusableInfo(${compName}): undefined — 池不接受`);
    } else if (Array.isArray(ret)) {
      AppStorage.setOrCreate('IReusableInfoArray', ret)
      console.info(`getReusableInfo(${compName}): Array[${ret.length}]`);
      ret.forEach((info: IReusableInfo, i: number) => {
        console.info(`  [${i}] reuseId=${info.reuseId}, count=${info.count}, maxCount=${info.maxCount}`);
      });
    } else {
      AppStorage.setOrCreate('IReusableInfo', ret)
      console.info(`getReusableInfo(${compName}): reuseId=${ret.reuseId}, count=${ret.count}, maxCount=${ret.maxCount}`);
    }
  }

  build() {
    Column({ space: 10 }) {
      Button('切换组件')
        .height('5%')
        .id('GlobalReusePoolChangeComponent')
        .onClick(() => {
          this.boolVal = !this.boolVal;
        })

      // 手动池检查按钮
      Button('检查 GlobalChild')
        .height('5%')
        .id('GlobalReusePoolCheckGlobalChild')
        .onClick(() => this.verifyPool('GlobalChild', GlobalChild))
      Button('检查 LegacyComp')
        .height('5%')
        .id('GlobalReusePoolCheckLegacyComp')
        .onClick(() => this.verifyPool('LegacyComp', LegacyComp))
      // 手动池检查按钮
      Button('检查 Appstorage')
        .onClick(() => {
          let arr = Array.from(AppStorage.keys())
          for (let index = 0; index < arr.length; index++) {
            console.log('www:', arr[index], AppStorage.get(arr[index]))

          }
        })
      Text(`${this.onUIFullyLoaded}`).id('onUIFullyLoaded').height('5%')

      if (this.flagShow) {
        if (this.boolVal) {
          GlobalChild().reuse({ reuseId: () => 'GlobalChildA' })
          GlobalChild().reuse({ reuseId: () => 'GlobalChildA' })
          NotReusableChild()
        } else {
          LegacyComp()
        }
      }

    }
  }
}

@ComponentV2
struct NotReusableChild {
  @Consumer() provide: number = 10;

  aboutToAppear() {
    const pool = UIUtils.getCustomComponentContext(this).getReusePool();
    AppStorage.setOrCreate('getReusePoolUndefined', pool)
    console.info('NotReusableChild aboutToAppear');
  }

  build() {
    Text(`NotReusableChild @Consumer: ${this.provide}`)
  }
}