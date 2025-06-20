import media from '@ohos.multimedia.media';

export class  AVPlayer {
  surfaceId: string;
  player?: media.AVPlayer
  status?: string;

  constructor(surfaceId: string) {
    this.surfaceId = surfaceId
  }

  async createAVPlayer() {
    this.player = await media.createAVPlayer()
    this.bindState()
  }

  async bindState() {
    if (this.player === null) {
      return
    }

    this.player?.on('stateChange', async (state: media.AVPlayerState) => {
      this.status = state
      console.log(`xc_state_${state}`)

      if (!this.player) {
        return
      }

      switch (state) {
        case 'idle':
          console.log('xc_idle')
        case 'initialized':
          this.player.surfaceId = this.surfaceId
          this.player?.prepare()
          console.log('xc_initialized')
        case 'prepared':
          this.player?.play()
          console.log('xc_prepared')
      }
    })
  }

  async init(url?: string) {
    if (this.player !== null) {
      await this.createAVPlayer()
    }

    if (this.player) {
      if (url?.length) {
        this.player.url = url
      } else {
        const fd = await getContext().resourceManager.getRawFd('VID_1.mp4')
        this.player.fdSrc = fd
      }
    }
  }

  async play() {
    if (this.status === 'paused') {
      this.player?.play()
    }
  }

  async pause() {
    if (this.status === 'playing') {
      this.player?.pause()
    }
  }

  async stop() {
    if (!this.player) {
      return
    }
    this.player?.stop()
    this.player?.reset()
  }
}