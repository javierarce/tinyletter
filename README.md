Ruby gem that retrieves the metadata of a given tinyletter newsletter.

### Installation

```gem install tinyletter```

### Usage

```ruby
require 'rubygems'
require 'tinyletter'

newsletter = Tinyletter::Newsletter.new('metafoundry')
puts newsletter.metadata 
```

That will output:

```ruby
{
  :title => "Metafoundry",
  :by => "Deb Chachra",
  :description => "Ingredients include: technology, systems, design, language, social justice, and geography. Less than 0.1% cats by volume. Manufactured in a facility that contains personality, emotions and a worldview.", 
  :archive_url => "http://tinyletter.com/metafoundry/archive"
}
```

#### Requesting the newsletter archive

```ruby
require 'rubygems'
require 'tinyletter'

newsletter = Tinyletter::Newsletter.new('vruba', { with_archive: true })
puts newsletter.metadata
```

If the newsletter has enabled its archives, that will output:

```ruby
{
  :title => "6",
  :by => "Charlie Loyd",
  :description => "Notes on things I’m thinking about, most weekends. Strictly a personal project, representing my own views alone. Recurring themes include psychogeography, space shuttles, food, and complaining.", 
  :archive_url => "http://tinyletter.com/vruba/archive",
  :archive => [{
    :date => "2016-07-25",
    :title => "6, 84: Antennapedia",
    :url => "http://tinyletter.com/vruba/letters/6-84-antennapedia",
    :description => "Of course everyone is talking about the Martha Nussbaum profile in *The New Yorker*  (via @equartey"
  }, {
    :date => "2016-07-11",
    :title => "6, 83: Build a ray",
    :url => "http://tinyletter.com/vruba/letters/6-83-build-a-ray",
    :description => "Hi! I think it’s time to re-introduce myself. This is an irregular newsletter on mixed topics. It comes from wanting to stay in loose touch with more people than I can personally. What I put here is..."
  }]
}
```
