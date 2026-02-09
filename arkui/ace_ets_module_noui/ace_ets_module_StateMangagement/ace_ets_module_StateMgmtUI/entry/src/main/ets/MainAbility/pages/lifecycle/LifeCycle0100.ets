import {
  ComponentInit,
  ComponentDisappear,
  UIUtils,
  CustomComponentLifecycleObserver,
  CustomComponentLifecycle,
  CustomComponentLifecycleState
} from '@kit.ArkUI';

export class Message0100 {
  public value: string | undefined;

  constructor(value: string) {
    this.value = value;
  }
}

@Entry
@Component
struct LifeCycle0100 {
  @State switch: boolean = true;

  build() {
    Column() {
      Button('Hello')
        .id('LifeCycle0100_01')
        .height('5%')
        .onClick(() => {
          this.switch = !this.switch;
        })
      if (this.switch) {
        // 如果只有一个复用的组件，可以不用设置reuseId。
        Child0100({ message: new Message0100('Child0100') })
          .reuseId('Child0100')
      }

    }
    .height('100%')
    .width('100%')

  }
}

@Reusable
@Component
struct Child0100 {
  @State message: Message0100 = new Message0100('AboutToReuse');
  @State label: string = 'HelloWorld';

  @ComponentInit
  myInit(): void {
    let leftStyle: CustomComponentLifecycle = UIUtils.getLifecycle(this);
    AppStorage.setOrCreate<CustomComponentLifecycleState>('lifecycle', leftStyle.getCurrentState())
    registerObserver0100(UIUtils.getLifecycle(this));
  }

  aboutToDisappear(): void {
    unRegisterObserver0100(UIUtils.getLifecycle(this));
  }

  build() {
    Column() {
      Text(this.message.value)
        .height('5%')
    }
  }
}

export class MyObserver0100 implements CustomComponentLifecycleObserver {
  // 重写CustomComponentLifecycleObserver中的生命周期事件，CustomComponentLifecycleObserver无法监听父组件的aboutToInit
  aboutToAppear() {
    AppStorage.setOrCreate<number>('aboutToAppear',
      AppStorage.get('aboutToAppear') === undefined ? 1 : AppStorage.get<number>('aboutToAppear')! + 1)
  }

  onDidBuild() {
    AppStorage.setOrCreate<number>('onDidBuild',
      AppStorage.get('onDidBuild') === undefined ? 1 : AppStorage.get<number>('onDidBuild')! + 1)
  }

  aboutToReuse(param?: ESObject) {
    AppStorage.setOrCreate<number>('aboutToReuse',
      AppStorage.get('aboutToReuse') === undefined ? 1 : AppStorage.get<number>('aboutToReuse')! + 1)
  }

  aboutToRecycle() {
    AppStorage.setOrCreate<number>('aboutToRecycle',
      AppStorage.get('aboutToRecycle') === undefined ? 1 : AppStorage.get<number>('aboutToRecycle')! + 1)
  }

  // 在父组件的aboutToDelete函数中解除注册监听，则无法监听父组件的aboutToDisappear
  aboutToDisappear() {
    AppStorage.setOrCreate<number>('aboutToDisappear',
      AppStorage.get('aboutToDisappear') === undefined ? 1 : AppStorage.get<number>('aboutToDisappear')! + 1)
  }
}

// 创建Observer对象
const observer = new MyObserver0100();

export function registerObserver0100(lifeCycle: CustomComponentLifecycle) {
  // 向lifeCycle注册监听
  lifeCycle.addObserver(observer);
}

export function unRegisterObserver0100(lifeCycle: CustomComponentLifecycle) {
  // 向lifeCycle取消注册监听
  lifeCycle.removeObserver(observer);
}