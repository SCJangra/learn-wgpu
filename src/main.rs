mod app;
mod state;

use anyhow::Result;
use winit::event_loop::EventLoop;

use app::App;

fn main() -> Result<()> {
    tracing_subscriber::fmt::init();

    let event_loop = EventLoop::with_user_event().build()?;
    let mut app = App::new();
    event_loop.run_app(&mut app)?;

    Ok(())
}
