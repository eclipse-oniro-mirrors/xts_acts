class NavParam {
  constructor(msg: string) {
    this.msg = msg
  }
  private msg: string = ''
}

@Entry
@Component
struct OnNewParamPage {
  @Provide stack: NavPathStack = new NavPathStack()
  @Provide('paramString') paramString: string = ''

  @Builder
  pageMap(name: string) {
    if (name === 'aboutToAppear pageOne MOVE_TO_TOP_SINGLETON') {
      lifeCyclePush({
        pushLifeCycle: 'aboutToAppear',
        targetName: 'pageOne',
        targetLaunchMode: LaunchMode.MOVE_TO_TOP_SINGLETON,
      })
    } else if (name === 'onReady pageOne STANDARD') {
      lifeCyclePush({
        pushLifeCycle: 'onReady',
        targetName: 'pageOne',
        targetLaunchMode: LaunchMode.STANDARD,
      })
    } else if (name === 'onReady pageTwo STANDARD') {
      lifeCyclePush({
        pushLifeCycle: 'onReady',
        targetName: 'pageTwo',
        targetLaunchMode: LaunchMode.STANDARD,
      })
    } else if (name === 'onReady pageOne MOVE_TO_TOP_SINGLETON') {
      lifeCyclePush({
        pushLifeCycle: 'onReady',
        targetName: 'pageOne',
        targetLaunchMode: LaunchMode.MOVE_TO_TOP_SINGLETON,
      })
    } else if (name === 'onReady pageTwo POP_TO_SINGLETON') {
      lifeCyclePush({
        pushLifeCycle: 'onReady',
        targetName: 'pageTwo',
        targetLaunchMode: LaunchMode.POP_TO_SINGLETON,
      })
    } else {
      Dest()
    }
  }

  build() {
    Column() {
      Column() {
        Text(this.paramString).id('paramId').height('10%')
      }
      Navigation(this.stack) {
        Button('pushPath pageOne')
          .onClick(() => {
            this.stack.pushPath({name: 'pageOne'})
          })
          .id('pushId')
          .height('10%')
      }
      .title('navBar')
      .titleMode(NavigationTitleMode.Mini)
      .navDestination(this.pageMap)
    }
  }
}


@Component
struct lifeCyclePush {
  @Consume stack: NavPathStack
  @State name: string = 'NA'
  pushLifeCycle: string = '__NA__'
  targetName: string = '__NA__'
  targetLaunchMode: LaunchMode = LaunchMode.STANDARD
  @Consume('paramString') paramString: string;

  launchModeToString(launchMode: LaunchMode) {
    if (launchMode === LaunchMode.STANDARD) {
      return 'STANDARD';
    } else if (launchMode === LaunchMode.NEW_INSTANCE) {
      return 'NEW_INSTANCE';
    } else if (launchMode === LaunchMode.POP_TO_SINGLETON) {
      return 'POP_TO_SINGLETON';
    } else if (launchMode === LaunchMode.MOVE_TO_TOP_SINGLETON) {
      return 'MOVE_TO_TOP_SINGLETON';
    } else {
      return 'NA';
    }
  }

  aboutToAppear(): void {
    if (this.pushLifeCycle === 'aboutToAppear' && this.targetName !== '__NA__') {
      this.stack.pushPath({name: this.targetName, param: new NavParam('aboutToAppear ' + this.targetName + ' ' + this.launchModeToString(this.targetLaunchMode))}, {launchMode: this.targetLaunchMode})
    }
  }

  build() {
    NavDestination() {
      NavBody()
    }
    .onReady((context) => {
      this.name = context.pathInfo.name
    })
    .onNewParam((param: ESObject) => {
      this.paramString = param;
      console.log('TestTag', this.name, 'onNewParam, param: ' + JSON.stringify(param))
    })
  }
}

@Component
struct Dest {
  @Consume stack: NavPathStack
  @State name: string = 'NA'
  @Consume('paramString') paramString: string;

  build() {
    NavDestination() {
      NavBody()
    }
    .onReady((context) => {
      this.name = context.pathInfo.name
    })
    .onNewParam((param: ESObject) => {
      this.paramString = JSON.stringify(param);
      console.log('TestTag', this.name, 'onNewParam, param: ' + JSON.stringify(param))
    })
  }
}

@Component
struct NavBody {
  @Consume stack: NavPathStack
  build() {
    Column() {
      Button('STANDARD')
        .onClick(() => {
          this.stack.pushPath({name: 'pageOne', param: new NavParam('push pageOne STANDARD')}, {launchMode: LaunchMode.STANDARD})
        })
        .id('standardId')
        .height('10%')
      Button('NEW_INSTANCE')
        .onClick(() => {
          this.stack.pushPath({name: 'pageOne', param: new NavParam('push pageOne NEW_INSTANCE')}, {launchMode: LaunchMode.NEW_INSTANCE})
        })
        .id('instanceId')
        .height('10%')
      Button('MOVE_TO_TOP_SINGLETON')
        .onClick(() => {
          this.stack.pushPath({name: 'pageOne', param: new NavParam('MOVE_TO_TOP_SINGLETON')}, {launchMode: LaunchMode.MOVE_TO_TOP_SINGLETON})
        })
        .id('moveId')
        .height('10%')
      Button('POP_TO_SINGLETON')
        .onClick(() => {
          this.stack.pushDestination({name: 'pageOne', param: 10 }, {launchMode: LaunchMode.POP_TO_SINGLETON})
        })
        .id('popId')
        .height('10%')
      }
      .width('100%')
  }
}