create table if not exists public.dashboard_state (
  id text primary key,
  state jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.dashboard_state enable row level security;

drop policy if exists "Allow public read dashboard state" on public.dashboard_state;
create policy "Allow public read dashboard state"
on public.dashboard_state
for select
using (true);

drop policy if exists "Allow public insert dashboard state" on public.dashboard_state;
create policy "Allow public insert dashboard state"
on public.dashboard_state
for insert
with check (true);

drop policy if exists "Allow public update dashboard state" on public.dashboard_state;
create policy "Allow public update dashboard state"
on public.dashboard_state
for update
using (true)
with check (true);

insert into public.dashboard_state (id, state)
values ('main', '{}'::jsonb)
on conflict (id) do nothing;
