<?php

namespace AppBundle\DataFixtures\ORM;

use AppBundle\Entity\IdeasWorkshop\Idea;
use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;
use Ramsey\Uuid\Uuid;

class LoadIdeaData extends AbstractFixture implements DependentFixtureInterface
{
    public const IDEA_01_UUID = 'e4ac3efc-b539-40ac-9417-b60df432bdc5';
    public const IDEA_02_UUID = '3b1ea810-115f-4b2c-944d-34a55d7b7e4d';
    public const IDEA_03_UUID = 'aa093ce6-8b20-4d86-bfbc-91a73fe47285';

    public function load(ObjectManager $manager)
    {
        $need = $this->getReference('need-legal');
        $category = $this->getReference('category-european');
        $theme = $this->getReference('theme-army-defense');
        $committee = $this->getReference('committee-1');
        $adherent = $this->getReference('adherent-3');

        $ideaName = 'Faire la paix';
        $ideaMakePeace = new Idea(
            Uuid::fromString(self::IDEA_01_UUID),
            $ideaName,
            $adherent,
            $category,
            $committee,
            new \DateTime()
        );
        $ideaMakePeace->addNeed($need);
        $ideaMakePeace->addTheme($theme);
        $this->addReference('idea-peace', $ideaMakePeace);

        $ideaName = 'Favoriser l\'écologie';
        $ideaHelpEcology = new Idea(
            Uuid::fromString(self::IDEA_02_UUID),
            $ideaName,
            $adherent,
            $category,
            $committee
        );
        $ideaHelpEcology->addTheme($theme);
        $this->addReference('idea-help-ecology', $ideaHelpEcology);

        $ideaName = 'Aider les gens';
        $ideaHelpPeople = new Idea(
            Uuid::fromString(self::IDEA_03_UUID),
            $ideaName,
            $adherent,
            $category,
            $committee,
            new \DateTime()
        );
        $ideaHelpPeople->addTheme($theme);
        $this->addReference('idea-help-people', $ideaHelpPeople);

        $manager->persist($ideaMakePeace);
        $manager->persist($ideaHelpEcology);
        $manager->persist($ideaHelpPeople);

        $manager->flush();
    }

    public function getDependencies(): array
    {
        return [
            LoadAdherentData::class,
            LoadIdeaNeedData::class,
            LoadIdeaCategoryData::class,
            LoadIdeaThemeData::class,
            LoadIdeaGuidelineData::class,
        ];
    }
}
